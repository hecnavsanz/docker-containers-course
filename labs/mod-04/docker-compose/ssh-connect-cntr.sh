#!/bin/bash
# connect with ssh to the docker container

# when providing the ssh port
# port = $1
# ssh -i ./labs/ssh-keys/corenetworks -l core -p $port -o StrictHostKeyChecking=no localhost

# when providing the docker container name (such as jenkins-server, jenkins-agent, git-server or git-developer-2)
cntr=$1
port=$(docker container inspect $cntr | jq -r '.[].HostConfig.PortBindings."22/tcp"[].HostPort')
chmod 600 ./labs/ssh-keys/corenetworks
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:$port" &> /dev/null
ssh -i ./labs/ssh-keys/corenetworks -l core -p $port -o StrictHostKeyChecking=no localhost
