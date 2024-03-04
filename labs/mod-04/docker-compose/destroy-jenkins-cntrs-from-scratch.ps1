# pwsh
# remove jenkins docker containers
# duration: about half a minute

$CWD = $PWD.Path
Set-Location "$CWD\devops"

# $Env:COMPOSE_PARALLEL_LIMIT = 1

# delete jenkins docker containers and images, volumes and network bridge
docker compose --file jenkins-compose-from-scratch.yml --env-file .\env\jenkins down --volumes --rmi all

Set-Location "$CWD"
