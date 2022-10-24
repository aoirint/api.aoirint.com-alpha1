#!/bin/bash

docker buildx build . -t update_swagger_ui
docker run --rm -e VERSION="v4.15.0" -e OUTPUT_ROOT=/dist -e JSON_URL="https://api.aoirint.com/swagger.yaml" -v "$PWD/public:/dist" update_swagger_ui
