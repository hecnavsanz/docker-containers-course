#!/bin/bash
# remove jenkins docker containers

CWD=$PWD
cd $CWD/devops

# export COMPOSE_PARALLEL_LIMIT=1

# delete jenkins docker containers and images, volumes and network bridge
docker compose --file jenkins-compose-from-scratch.yml --env-file ./env/jenkins down --volumes --rmi all

cd $CWD
