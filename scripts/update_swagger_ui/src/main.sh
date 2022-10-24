#!/bin/bash

set -eu

BASE_ROOT=$(realpath $(dirname $0))

echo "Base root: ${BASE_ROOT:?}"
echo "Swagger UI version: ${VERSION:?}"
echo "Output root: ${OUTPUT_ROOT:?}"

TMP_ROOT=$(mktemp -d "tmp.swagger-ui.XXXXXX")
trap 'rm -rf -- "${TMP_ROOT}"' EXIT

cd "${TMP_ROOT}"

wget -O swagger-ui.zip "https://github.com/swagger-api/swagger-ui/archive/refs/tags/${VERSION}.zip"
unzip swagger-ui.zip

cp "${BASE_ROOT}/swagger-initializer.js" swagger-ui-*/dist/swagger-initializer.js

mkdir -p "${OUTPUT_ROOT}"
rsync -av --delete swagger-ui-*/dist/ "${OUTPUT_ROOT}/"
