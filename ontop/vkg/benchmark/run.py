#!/usr/bin/env python3
"""Run SPARQL tests against per-configuration Ontop endpoints."""
import argparse, json, os, statistics, sys, time
from pathlib import Path

import requests
from shapely import wkt as shapely_wkt

HERE = Path(__file__).parent
CRS84 = "http://www.opengis.net/def/crs/OGC/1.3/CRS84"
XSD_BOOL = "http://www.w3.org/2001/XMLSchema#boolean"

ENGINES = {
    "ontop":  "http://ontop-{config}:8080/sparql",
    "jena":   "http://jena-{config}:3030/ds/sparql",
    "qlever": "http://qlever-{config}:7001/",
}

# ---------- endpoint helpers ----------
def wait_ready(url, timeout):
    deadline = time.time() + timeout
    while time.time() < deadline:
        try:
            r = requests.post(url, data={"query": "ASK {}"},
                              headers={"Accept": "application/sparql-results+json"}, timeout=10)
            if r.status_code == 200:
                return True
        except requests.RequestException:
            pass
        time.sleep(2)
    return False


def run_query(url, query, timeout):
    t = time.perf_counter()
    r = requests.post(url, data=query.encode("utf-8"),
                      headers={"Content-Type": "application/sparql-query",
                               "Accept": "application/sparql-results+json"},
                      timeout=timeout)
    elapsed = time.perf_counter() - t
    if r.status_code != 200:
        raise RuntimeError(f"HTTP {r.status_code}: {r.text[:500]}")
    body = r.json()
    if "boolean" in body:
        return [{"result": {"type": "literal", "datatype": XSD_BOOL,
                            "value": str(body["boolean"]).lower()}}], elapsed
    if any("result" not in b for b in body["results"]["bindings"]):
            raise RuntimeError("unsupported: unbound ?result (function evaluated to NULL)")
    return body["results"]["bindings"], elapsed


# ---------- comparison ----------
def split_crs(v):
    v = v.strip()
    if v.startswith("<") and ">" in v:
        i = v.index(">")
        return v[1:i], v[i + 1:].strip()
    return CRS84, v  # implicit CRS = CRS84 per GeoSPARQL


import re
from shapely.geometry import Polygon

def load_wkt(text):
    try:
        return shapely_wkt.loads(text)
    except Exception:
        # Ontop can emit rings whose last point differs from the first by float noise
        if text.strip().upper().startswith("POLYGON"):
            nums = [float(x) for x in re.findall(r"-?\d+\.?\d*(?:[eE][-+]?\d+)?", text)]
            return Polygon(list(zip(nums[0::2], nums[1::2])))  # Polygon() closes the ring
        raise

def geom_equal(a, e, tol):
    ca, wa = split_crs(a)
    ce, we = split_crs(e)
    if ca != ce:
        return False
    #ga, ge = shapely_wkt.loads(wa), shapely_wkt.loads(we)
    ga, ge = load_wkt(wa), load_wkt(we)
    if ga.is_empty and ge.is_empty:
        return True
    return ga.equals(ge) or ga.normalize().equals_exact(ge.normalize(), tol)


def term_equal(a, e, mode, tol):
    if a.get("type") != e.get("type"):
        return False
    if e.get("datatype") and a.get("datatype") != e.get("datatype"):
        return False
    try:
        if mode == "numeric":
            return abs(float(a["value"]) - float(e["value"])) <= tol
        if mode == "geometry-equality":
            return geom_equal(a["value"], e["value"], tol)
        if mode == "geometry-hausdorff":
            ca, wa = split_crs(a["value"])
            ce, we = split_crs(e["value"])
            if ca != ce:
                return False
            #return shapely_wkt.loads(wa).hausdorff_distance(shapely_wkt.loads(we)) <= tol
            return load_wkt(wa).hausdorff_distance(load_wkt(we)) <= tol
    except Exception:
        return False
    return a["value"] == e["value"]


def row_equal(a, e, mode, tol):
    return all(v in a and term_equal(a[v], t, mode, tol) for v, t in e.items())


def rows_match(actual, expected, mode, tol):
    if len(actual) != len(expected):
        return False
    remaining = list(actual)
    for e in expected:
        for i, a in enumerate(remaining):
            if row_equal(a, e, mode, tol):
                del remaining[i]
                break
        else:
            return False
    return True

# ---------- main ----------
def evaluate(exp, actual, error):
    if exp is None:
        return "PENDING", "no expectation defined"
    if exp.get("expectError"):
        return ("PASS", "") if error else ("FAIL", "expected an error, got a result")
    if error and any(s in error.lower() for s in ("not supported", "unknown function", "unsupported")):
            return "UNSUPPORTED", error
    if error:
        return "ERROR", error
    accepted = exp.get("acceptedResults", [])
    if exp.get("status") == "needs-oracle" or exp.get("expectedResultPending") or not accepted:
        return "PENDING", "no oracle yet"
    mode, tol = exp.get("comparison", "exact"), exp.get("tolerance", 0.0)
    if any(rows_match(actual, a["bindings"], mode, tol) for a in accepted):
        return "PASS", ""
    return "FAIL", "result did not match any accepted result"


def resolve_expectation(entry, cfg, engine):
    if entry is None:
        return None
    base = {k: v for k, v in entry.items() if k not in ("byConfiguration", "byEngine")}
    return {**base, **entry.get("byConfiguration", {}).get(cfg, {}),
            **entry.get("byEngine", {}).get(engine, {})}

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--engine", default=os.environ.get("ENGINE", "ontop"), choices=ENGINES)
    p.add_argument("--endpoint-template", default=None,
                   help="URL with optional {config} placeholder; defaults per engine")
    p.add_argument("--queries-dir", default=os.environ.get("QUERIES_DIR", str(HERE.parent / "queries")))
    p.add_argument("--expected", default=str(HERE / "expected-results.json"))
    p.add_argument("--output", default=None, help="defaults to results/<engine>.json")
    p.add_argument("--test", action="append", help="test id (repeatable)")
    p.add_argument("--config", action="append", help="configuration id (repeatable)")
    p.add_argument("--repeat", type=int, default=3)
    p.add_argument("--warmup", type=int, default=1)
    p.add_argument("--timeout", type=int, default=120)
    p.add_argument("--wait", type=int, default=180)
    args = p.parse_args()

    if args.endpoint_template is None:
        args.endpoint_template = ENGINES[args.engine]
    if args.output is None:
        args.output = str(HERE / "results" / f"{args.engine}.json")

    configs = json.loads((HERE / "configurations.json").read_text())["configurations"]
    tests = json.loads((HERE / "tests.json").read_text())["tests"]
    expected = json.loads(Path(args.expected).read_text()) if Path(args.expected).exists() else {}

    ready = {}
    results = []
    for t in tests:
        if args.test and t["id"] not in args.test:
            continue
        query = (Path(args.queries_dir) / t["query"]).read_text()
        for cfg in t["configurations"]:
            if args.config and cfg not in args.config:
                continue
            if cfg not in configs:
                results.append({"test": t["id"], "config": cfg, "status": "ERROR",
                                "detail": "unknown configuration"})
                continue
            url = args.endpoint_template.format(config=cfg)
            if url not in ready:
                ready[url] = wait_ready(url, args.wait)
            if not ready[url]:
                results.append({"test": t["id"], "config": cfg, "status": "ERROR",
                                "detail": f"endpoint {url} not reachable"})
                continue

            actual, error, times = [], None, []
            try:
                for _ in range(args.warmup):
                    run_query(url, query, args.timeout)
                for _ in range(max(args.repeat, 1)):
                    actual, dt = run_query(url, query, args.timeout)
                    times.append(dt)
            except Exception as ex:
                error = str(ex)

            status, detail = evaluate(resolve_expectation(expected.get(t["id"]), cfg, args.engine), actual, error)
            results.append({
                "test": t["id"], "config": cfg, "status": status, "detail": detail,
                "median_s": statistics.median(times) if times else None,
                "min_s": min(times) if times else None,
                "max_s": max(times) if times else None,
                "actual": actual,
            })
            med = f"{statistics.median(times)*1000:8.1f} ms" if times else "      n/a"
            print(f"{status:8} {t['id']:<22} {cfg:<16} {med}  {detail}")

    out = Path(args.output)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(results, indent=2))
    counts = {s: sum(r["status"] == s for r in results)
              for s in ("PASS", "FAIL", "ERROR", "UNSUPPORTED", "PENDING")}
    print("\n" + "  ".join(f"{k}={v}" for k, v in counts.items()) + f"   -> {out}")
    sys.exit(1 if counts["FAIL"] or counts["ERROR"] else 0)


if __name__ == "__main__":
    main()