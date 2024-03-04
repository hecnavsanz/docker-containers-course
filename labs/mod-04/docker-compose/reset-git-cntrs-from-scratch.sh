#!/bin/bash
# reset git docker containers

CWD=$PWD
cd $CWD/devops

# export COMPOSE_PARALLEL_LIMIT=1

# docker images are not re-built, just the containers are recreated
docker compose --file git-compose-from-scratch.yml --env-file ./env/git down --volumes
docker compose --file git-compose-from-scratch.yml --env-file ./env/git up --detach

cd $CWD
