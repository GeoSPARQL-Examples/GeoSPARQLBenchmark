FROM python:3.12-slim
RUN pip install --no-cache-dir requests shapely
WORKDIR /work/benchmark
ENTRYPOINT ["python", "run.py"]