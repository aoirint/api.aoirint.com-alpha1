#!/bin/bash

echo "Input path: ${INPUT_PATH:?}"
echo "Output path: ${OUTPUT_PATH:?}"

yq '.' "${INPUT_PATH}" | tee "${OUTPUT_PATH}"
