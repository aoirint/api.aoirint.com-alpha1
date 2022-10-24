#!/bin/bash

set -eu
OUTPUT_ROOT=/home/aoi/apps/api.aoirint.com/public/docs

docker buildx build . -t update_swagger_ui
docker run --rm -e VERSION="v4.15.0" -e OUTPUT_ROOT=/dist -v "${OUTPUT_ROOT}:/dist" update_swagger_ui
