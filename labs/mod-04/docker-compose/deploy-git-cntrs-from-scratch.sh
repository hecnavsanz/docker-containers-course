#!/bin/bash

# deploy git docker containers
# duration: about 5 to 10 minutes

CWD=$PWD
cd $CWD/devops

# export COMPOSE_PARALLEL_LIMIT=1

# build step
docker compose --file git-compose-from-scratch.yml --env-file ./env/git build --no-cache

# wait 5 seconds
echo "Waiting 5 secs ..."
sleep 5

# run step
docker compose --file git-compose-from-scratch.yml --env-file ./env/git up --detach

cd $CWD
