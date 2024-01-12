FROM python:3.11-slim-bookworm

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --yes --no-install-recommends gcc libc6-dev

WORKDIR /app

COPY script/setup ./script/
COPY setup.py requirements.txt MANIFEST.in ./
COPY wyoming_led/ ./wyoming_led/

RUN script/setup

COPY script/run ./script/
COPY docker/run ./

EXPOSE 10500

ENTRYPOINT ["/app/run"]
