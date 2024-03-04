#!/bin/bash
# stop jenkins docker containers

CWD=$PWD
cd $CWD/devops

# stop the jenkins agent and server systemd services
docker exec -it jenkins-agent sudo -u core sh -c "sh /labs/mod-08/jenkins/scripts/stop-jenkins-agent.sh inbound"
docker exec -it jenkins-agent sudo -u core sh -c "sh /labs/mod-08/jenkins/scripts/stop-jenkins-agent.sh outbound"
docker exec -it jenkins-server sudo -u core sh -c "sh /labs/mod-08/jenkins/scripts/stop-jenkins-server-git-http-server.sh"
# wait for 20 secs ...
sleep 20
# stop the jenkins docker containers (can be started later to continue in the last state were left)
docker compose --file jenkins-compose-from-scratch.yml --env-file ./env/jenkins stop

cd $CWD
