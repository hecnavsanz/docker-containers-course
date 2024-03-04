# pwsh
# reset git docker containers

$CWD = $PWD.Path
Set-Location "$CWD\devops"

# $Env:COMPOSE_PARALLEL_LIMIT = 1

# docker images are not re-built, just the containers are recreated
docker compose --file git-compose-from-scratch.yml --env-file .\env\git down --volumes
docker compose --file git-compose-from-scratch.yml --env-file .\env\git up --detach

Set-Location "$CWD"
