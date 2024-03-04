# pwsh
# connect with ssh to the docker container

# when providing the ssh port
# $port = $Args[0]
# ssh -i .\labs\ssh-keys\corenetworks -l core -p $port -o StrictHostKeyChecking=no localhost

# when providing the docker container name (such as jenkins-server, jenkins-agent, git-server or git-developer-2)
$cntr = $Args[0]
$port = $(docker container inspect $cntr | ConvertFrom-Json).HostConfig.PortBindings."22/tcp".HostPort
ssh-keygen -f "$HOME\.ssh\known_hosts" -R "[localhost]:$port" 1> $null 2> $null
ssh -i .\labs\ssh-keys\corenetworks -l core -p $port -o StrictHostKeyChecking=no localhost
