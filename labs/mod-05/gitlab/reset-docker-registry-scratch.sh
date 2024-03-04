#!/bin/bash

# export COMPOSE_PARALLEL_LIMIT=1
docker compose --file compose-docker-registry.yml --env-file ./env/git down
docker compose --file compose-docker-registry.yml --env-file ./env/git up --detach