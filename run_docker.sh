#! /bin/bash

set -e

image=srp33/confounded-paper:version1

docker build -t $image .

mkdir -p data/simulated_expression data/bladderbatch data/gse37199 data/tcga data/tcga_medium data/tcga_small
mkdir -p outputs/figures outputs/tables outputs/metrics
chmod 777 outputs -R

#docker run -d --rm \
docker run -i -t --rm \
  --user $(id -u):$(id -g) \
  -v $(pwd)/data:/data \
  -v $(pwd)/outputs:/outputs \
  -v $(pwd)/scripts:/scripts \
  $image \
  bash -c /scripts/all.sh
