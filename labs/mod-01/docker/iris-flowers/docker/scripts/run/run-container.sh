#!/usr/bin/env bash

# run iris flowers docker container
# arguments:
#   - Image Type: ubuntu, python, ml-venv, train-eval-models or predict-using-best-model
#   - Image Tag: image tag to specify when running the container
# examples:
#   (iris-flowers)$ sh docker/scripts/run/run-container.sh ubuntu 22.04
#   (iris-flowers)$ sh docker/scripts/run/run-container.sh python 3.9
#   (iris-flowers)$ sh docker/scripts/run/run-container.sh ml-venv 1.1

# image type and tag
img_type=$1
img_tag=$2
# run container
docker run -d -it \
    --name iris-flowers-"$img_type"-"$img_tag"-cntr \
    iris-flowers-"$img_type":"$img_tag"
