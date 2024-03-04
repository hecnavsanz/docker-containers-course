#!/bin/bash
# remove git docker containers

CWD=$PWD
cd $CWD/devops

# export COMPOSE_PARALLEL_LIMIT=1

# delete git docker containers and images, volumes and network bridge
docker compose --file git-compose-from-scratch.yml --env-file ./env/git down --volumes --rmi all

cd $CWD
