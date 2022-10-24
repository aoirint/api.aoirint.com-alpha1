#!/bin/bash

set -eu
OUTPUT_PATH=/home/aoi/apps/api.aoirint.com/public/niconico_live

docker buildx build . -t update_niconico_live
docker run --rm -e OUTPUT_PATH="/output/$(basename "${OUTPUT_PATH}")" -v "$(realpath $(dirname "${OUTPUT_PATH}")):/output" update_niconico_live
