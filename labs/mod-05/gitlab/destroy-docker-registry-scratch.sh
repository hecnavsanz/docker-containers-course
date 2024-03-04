#!/bin/bash

export COMPOSE_PARALLEL_LIMIT=1
export COMPOSE_IGNORE_ORPHANS=True
docker compose --file compose-docker-registry.yml --env-file ./env/git down --volumes --rmi all
docker rmi registry:2