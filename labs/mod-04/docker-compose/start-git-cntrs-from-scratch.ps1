# pwsh
# start git docker containers

$CWD = $PWD.Path
Set-Location "$CWD\devops"

# start the git containers in the last state were left (can be stopped later)
docker compose --file git-compose-from-scratch.yml --env-file .\env\git start git-srv
docker compose --file git-compose-from-scratch.yml --env-file .\env\git start git-dev-1
docker compose --file git-compose-from-scratch.yml --env-file .\env\git start git-dev-2

Set-Location "$CWD"
