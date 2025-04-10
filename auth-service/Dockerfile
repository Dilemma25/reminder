FROM python:3.13-alpine AS base
ENV PYTHONBUFFERED=1

WORKDIR /app

COPY ./poetry.lock .
COPY ./pyproject.toml .

RUN pip install poetry==2.0.0
RUN poetry install --no-root

ENTRYPOINT [ "sh", "-c","poetry run uvicorn api.app:app --host 0.0.0.0 --port 8000 --reload" ]