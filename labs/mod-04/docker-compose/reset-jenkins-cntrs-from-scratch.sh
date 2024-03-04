#!/bin/bash
# reset jenkins docker containers

CWD=$PWD
cd $CWD/devops

# export COMPOSE_PARALLEL_LIMIT=1

# docker images are not re-built, just the containers are recreated
docker compose --file jenkins-compose-from-scratch.yml --env-file ./env/jenkins down --volumes
docker compose --file jenkins-compose-from-scratch.yml --env-file ./env/jenkins up --detach

cd $CWD
