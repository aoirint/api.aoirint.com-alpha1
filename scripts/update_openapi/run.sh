#!/bin/bash

set -eu
INPUT_PATH=/home/aoi/apps/api.aoirint.com/openapi.yaml
OUTPUT_PATH=/home/aoi/apps/api.aoirint.com/public/openapi.json

docker buildx build . -t update_openapi
docker run --rm -e INPUT_PATH="/input/$(basename "${INPUT_PATH}")" -e OUTPUT_PATH="/output/$(basename "${OUTPUT_PATH}")" -v "$(realpath $(dirname "${INPUT_PATH}")):/input" -v "$(realpath $(dirname "${OUTPUT_PATH}")):/output" update_openapi
