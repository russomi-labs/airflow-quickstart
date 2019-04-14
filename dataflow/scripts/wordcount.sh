#!/usr/bin/env bash

# Echo every line
set -v

# Turn on exiting on Error
set -eE

cd dataflow

python -m wordcount.wordcount \
    --input gs://dataflow-samples/shakespeare/kinglear.txt \
    --output /tmp/counts
