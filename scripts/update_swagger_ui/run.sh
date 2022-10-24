#!/bin/bash

set -eu

BASE_ROOT=$(realpath $(dirname $0))
OUTPUT_ROOT=${BASE_ROOT}/../../public/docs

docker buildx build . -t update_swagger_ui
docker run --rm -e VERSION="v4.15.0" -e OUTPUT_ROOT=/dist -e JSON_URL="https://api.aoirint.com/openapi.json" -v "${OUTPUT_ROOT}:/dist" update_swagger_ui
