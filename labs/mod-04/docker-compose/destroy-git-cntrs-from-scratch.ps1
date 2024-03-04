# pwsh
# remove git docker containers

$CWD = $PWD.Path
Set-Location "$CWD\devops"

# $Env:COMPOSE_PARALLEL_LIMIT = 1

# delete git docker containers and images, volumes and network bridge
docker compose --file git-compose-from-scratch.yml --env-file .\env\git down --volumes --rmi all

Set-Location "$CWD"
