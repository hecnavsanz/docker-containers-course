#!/bin/bash

# in a Cloud VM: 2vCPUs / 8GB RAM / 
# it could take 10-15 minutes to complete

# export COMPOSE_PARALLEL_LIMIT=1
docker compose --file compose-from-scratch.yml --env-file ./env/git build --no-cache
docker compose --file compose-from-scratch.yml --env-file ./env/git up --detach