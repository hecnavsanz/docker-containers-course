#!/usr/bin/env bash

# connect to iris flowers docker container
# arguments:
#   - Image Type: ubuntu, python or ml-venv
#   - Image Tag: image tag to specify when connecting the container
# examples:
#   (iris-flowers)$ sh docker/scripts/run/connect-container.sh "ubuntu" "20.04"
#   (iris-flowers)$ sh docker/scripts/run/connect-container.sh "ml-venv" "1.0"
#   (iris-flowers)$ sh docker/scripts/run/connect-container.sh "python" "3.9"

# image type and tag
img_type=$1
img_tag=$2
# connect to container
docker exec -it iris-flowers-"$img_type"-"$img_tag"-cntr bash
