#!/bin/bash
# stop git docker containers

CWD=$PWD
cd $CWD/devops

# stop the git http(s) server systemd services
docker exec -it git-server sudo -u core sh -c "sh /labs/mod-07/git/scripts/stop-git-http-server.sh"
# wait for 20 secs ...
sleep 20
# stop the git docker containers (can be started later to continue in the last state were left)
docker compose --file git-compose-from-scratch.yml --env-file ./env/git stop

cd $CWD
