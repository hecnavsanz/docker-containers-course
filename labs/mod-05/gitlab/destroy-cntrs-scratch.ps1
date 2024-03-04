# pwsh

$Env:COMPOSE_PARALLEL_LIMIT = 1
docker compose --file compose-from-scratch.yml --env-file ./env/git down --volumes --rmi all