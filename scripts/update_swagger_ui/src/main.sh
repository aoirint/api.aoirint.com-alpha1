#!/bin/bash

set -eu

echo "Swagger UI version: ${VERSION:?}"
echo "Output root: ${OUTPUT_ROOT:?}"
echo "Swagger JSON URL: ${JSON_URL:?}"

TMP_ROOT=$(mktemp -d "tmp.swagger-ui.XXXXXX")
trap 'rm -rf -- "${TMP_ROOT}"' EXIT

cd "${TMP_ROOT}"

wget -O swagger-ui.zip "https://github.com/swagger-api/swagger-ui/archive/refs/tags/${VERSION}.zip"
unzip swagger-ui.zip

sed -i -e "s|https://petstore.swagger.io/v2/swagger.json|${JSON_URL}|g" swagger-ui-*/dist/swagger-initializer.js

mkdir -p "${OUTPUT_ROOT}"
rsync -av --delete swagger-ui-*/dist/ "${OUTPUT_ROOT}/"
