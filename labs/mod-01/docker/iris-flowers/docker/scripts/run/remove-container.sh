#!/usr/bin/env bash

# remove iris flowers docker container
# arguments:
#   - Image Type: ubuntu, python, ml-venv, train-eval-models or predict-using-best-model
#   - Image Tag: image tag to specify when running the container
# examples:
#   (iris-flowers)$ sh docker/scripts/run/remove-container.sh ubuntu 22.04
#   (iris-flowers)$ sh docker/scripts/run/remove-container.sh python 3.9
#   (iris-flowers)$ sh docker/scripts/run/remove-container.sh ml-venv 1.1

# image type and tag
img_type=$1
img_tag=$2
# stop container
docker stop -s SIGKILL iris-flowers-"$img_type"-"$img_tag"-cntr
# remove container
docker rm iris-flowers-"$img_type"-"$img_tag"-cntr
