#!/bin/bash

# export COMPOSE_PARALLEL_LIMIT=1
export COMPOSE_IGNORE_ORPHANS=True
docker pull registry:2
docker compose --file compose-docker-registry.yml --env-file ./env/git up --detach