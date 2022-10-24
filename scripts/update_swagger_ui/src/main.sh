#!/bin/bash

set -eu

echo "Swagger UI version: ${VERSION:?}"
echo "Output root: ${OUTPUT_ROOT:?}"

TMP_ROOT=$(mktemp -d "tmp.swagger-ui.XXXXXX")
trap 'rm -rf -- "${TMP_ROOT}"' EXIT

cd "${TMP_ROOT}"

wget -O swagger-ui.zip "https://github.com/swagger-api/swagger-ui/archive/refs/tags/${VERSION}.zip"
unzip swagger-ui.zip

mkdir -p "${OUTPUT_ROOT}"
rsync -av --delete swagger-ui-*/dist/ "${OUTPUT_ROOT}/"
