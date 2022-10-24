#!/bin/bash

docker buildx build . -t update_swagger_ui
docker run --rm -e VERSION="v4.15.0" -e OUTPUT_ROOT=/dist -e JSON_URL="https://api.aoirint.com/openapi.json" -v "$PWD/public/docs:/dist" update_swagger_ui
