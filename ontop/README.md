## Instructions

### Run tests Ontop
docker compose run --rm benchmark

### Materialize
docker compose --profile materialize run --rm materialize

### Run tests QLever
mkdir -p data/qlever
F="-f docker-compose.ontop.yml -f docker-compose.qlever.yml"

1. build the index (once)
docker compose $F --profile qlever-index run --rm qlever-index

2. start the server
docker compose $F --profile qlever up -d qlever

3. smoke test
curl -s localhost:7001 -H "Accept: application/sparql-results+json" --data-urlencode "query=SELECT * WHERE { ?s ?p ?o } LIMIT 3"

4. run the benchmark
docker compose $F --profile benchmark run --rm --no-deps benchmark \
sh -c "pip install -q --root-user-action=ignore requests shapely && \
python run.py --engine qlever --endpoint-template http://qlever:7001/ \
--output results/qlever.json"

### Run tests Jena
F="-f docker-compose.ontop.yml -f docker-compose.jena.yml"

# 1. build (first time takes several minutes: clones and compiles Jena)
docker compose $F --profile jena build jena

# 2. check the flags I assumed (-rf, -l) exist
docker run --rm geobench/jena:jena-6.3.0 --help

# 3. start and watch the log until the server reports it is running
docker compose $F --profile jena up -d jena
docker compose $F logs -f jena

# 4. smoke test
curl -s localhost:3030/ds/sparql -H "Accept: application/sparql-results+json" \
--data-urlencode "query=SELECT * WHERE { ?s ?p ?o } LIMIT 3"

# 5. run the benchmark
docker compose $F --profile benchmark run --rm --no-deps benchmark \
sh -c "pip install -q --root-user-action=ignore requests shapely && \
python run.py --engine jena --endpoint-template http://jena:3030/ds/sparql \
--output results/jena-6.3.0.json"