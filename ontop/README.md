# GeoSPARQL 1.1 Benchmark

This benchmark evaluates the support and performance of selected spatial
query functions defined in the OGC GeoSPARQL 1.1 standard, focusing on
the following requirements:

- **Requirement 39:** Non-topological Query Functions (Simple Features)
- **Requirement 40:** Non-topological Query Functions (Non Simple Features)
- **Requirement 42:** Spatial Aggregate Functions

The benchmark is designed to evaluate and compare the following systems:

- **Ontop** — Virtual Knowledge Graph (VKG) system
- **QLever** — RDF triple store and SPARQL query engine
- **Apache Jena** — RDF framework with GeoSPARQL support

The following sections describe how to prepare the datasets, start the
respective systems, and execute the benchmark using Docker Compose.

## 1. Running the Ontop Benchmark

Execute the benchmark against Ontop:

```bash
docker compose run --rm benchmark
```

## 2. RDF Materialization

Materialize the virtual RDF graph into an RDF dataset for use with
materialized RDF systems, such as QLever and Apache Jena.

```bash
docker compose --profile materialize run --rm materialize
```

## 3. Running the QLever Benchmark

### 3.1. Prepare the environment

Create the directory for storing the QLever index and configure the
Docker Compose files:

```bash
mkdir -p data/qlever

F="-f docker-compose.ontop.yml -f docker-compose.qlever.yml"
```

### 3.2. Build the index

Build the QLever index from the materialized RDF dataset.

This step only needs to be performed once per dataset, unless the
underlying RDF data or indexing configuration changes.

```bash
docker compose $F --profile qlever-index run --rm qlever-index
```

### 3.3. Start the QLever server

```bash
docker compose $F --profile qlever up -d qlever
```

Monitor the server logs until QLever is ready to accept queries:

```bash
docker compose $F logs -f qlever
```

### 3.4. Verify the SPARQL endpoint

Execute a simple SPARQL query to verify that the endpoint is operational:

```bash
curl -s http://localhost:7001/ \
  -H "Accept: application/sparql-results+json" \
  --data-urlencode "query=SELECT * WHERE { ?s ?p ?o } LIMIT 3"
```

### 3.5. Execute the benchmark

```bash
docker compose $F --profile benchmark run --rm --no-deps benchmark \
  sh -c "pip install -q --root-user-action=ignore requests shapely && \
  python run.py \
    --engine qlever \
    --endpoint-template http://qlever:7001/ \
    --output results/qlever.json"
```

The benchmark results are saved to:

```text
results/qlever.json
```

## 4. Running the Apache Jena Benchmark

### 4.1. Prepare the environment

Configure the Docker Compose files:

```bash
F="-f docker-compose.ontop.yml -f docker-compose.jena.yml"
```

### 4.2. Build the Jena Docker image

Build the Apache Jena image with GeoSPARQL support.

The initial build may take several minutes, as it involves cloning
and compiling the Jena source code.

```bash
docker compose $F --profile jena build jena
```

### 4.3. Verify the available command-line options

Check the available GeoSPARQL server options, including `-rf` and `-l`:

```bash
docker run --rm geobench/jena:jena-6.3.0 --help
```

### 4.4. Start the Jena server

```bash
docker compose $F --profile jena up -d jena
```

Monitor the server logs until the RDF dataset has been loaded and
the SPARQL endpoint is ready:

```bash
docker compose $F logs -f jena
```

### 4.5. Verify the SPARQL endpoint

Execute a simple SPARQL query to verify that the endpoint is operational:

```bash
curl -s http://localhost:3030/ds/sparql \
  -H "Accept: application/sparql-results+json" \
  --data-urlencode "query=SELECT * WHERE { ?s ?p ?o } LIMIT 3"
```

### 4.6. Execute the benchmark

```bash
docker compose $F --profile benchmark run --rm --no-deps benchmark \
  sh -c "pip install -q --root-user-action=ignore requests shapely && \
  python run.py \
    --engine jena \
    --endpoint-template http://jena:3030/ds/sparql \
    --output results/jena-6.3.0.json"
```

The benchmark results are saved to:

```text
results/jena-6.3.0.json
```

## 5. SPARQL Endpoints

| System | SPARQL endpoint | Data access approach |
|--------|-----------------|----------------------|
| Ontop | `http://localhost:8080/sparql` | Virtual RDF graph |
| QLever | `http://localhost:7001/` | Materialized RDF with persistent indexes |
| Apache Jena | `http://localhost:3030/ds/sparql` | Materialized RDF |

## 6. Benchmark Results

The benchmark results are stored in JSON format in the `results/`
directory. Separate output files are generated for each system,
allowing their results to be compared independently.