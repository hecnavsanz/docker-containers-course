#!/usr/bin/env bash

# create iris flowers docker volumes
# examples:
#   (iris-flowers)$ sh docker/scripts/run/create-volumes.sh

# create data and results volumes
docker volume create iris-flowers-ml-data
docker volume create iris-flowers-ml-results
docker volume ls --filter name=iris-flowers-*
