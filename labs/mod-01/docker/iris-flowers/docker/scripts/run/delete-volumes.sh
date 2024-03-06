#!/usr/bin/env bash

# delete iris flowers docker volumes
# examples:
#   (iris-flowers)$ sh docker/scripts/run/delete-volumes.sh

# delete data and results volumes
docker volume rm --force iris-flowers-ml-data
docker volume rm --force iris-flowers-ml-results
docker volume ls --filter name=iris-flowers-*
