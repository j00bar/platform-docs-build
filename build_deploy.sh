#!/bin/bash

set -exv

PLATFORM_DOCS_IMAGE="quay.io/cloudservices/platform-docs"
IMAGE_TAG=$(date -u +%Y%m%d.%H%M%S)

if [[ -z "$QUAY_USER" || -z "$QUAY_TOKEN" ]]; then
    echo "QUAY_USER and QUAY_TOKEN must be set"
    exit 1
fi

DOCKER_CONF="$PWD/.docker"
mkdir -p "$DOCKER_CONF"
docker --config="$DOCKER_CONF" login -u="$QUAY_USER" -p="$QUAY_TOKEN" quay.io

docker --config="$DOCKER_CONF" build -t "${PLATFORM_DOCS_IMAGE}:${IMAGE_TAG}" .

docker --config="$DOCKER_CONF" push "${PLATFORM_DOCS_IMAGE}:${IMAGE_TAG}"
