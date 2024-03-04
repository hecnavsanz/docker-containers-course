#!/bin/bash

# deploy jenkins docker containers
# duration: about 10 to 20 minutes

CWD=$PWD
cd $CWD/devops

# export COMPOSE_PARALLEL_LIMIT=1

# build step
docker compose --file jenkins-compose-from-scratch.yml --env-file ./env/jenkins build --no-cache

# wait 5 seconds
echo "Waiting 5 secs ..."
sleep 5

# run step
docker compose --file jenkins-compose-from-scratch.yml --env-file ./env/jenkins up --detach

cd $CWD
