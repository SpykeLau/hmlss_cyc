# syntax=docker/dockerfile:1

FROM python:3.12-slim AS builder
WORKDIR /install
COPY crawler/requirements.txt summarizer/requirements.txt push_service/requirements.txt ./
RUN cat crawler/requirements.txt summarizer/requirements.txt push_service/requirements.txt > all.txt && \
    pip install --prefix=/usr/local --no-cache-dir -r all.txt

FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /usr/local /usr/local
COPY . /app
CMD ["python", "push_service/push.py"]
