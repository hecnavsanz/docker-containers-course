# pwsh

# deploy git docker containers
# duration: about 10 to 20 minutes

$CWD = $PWD.Path
Set-Location $CWD\devops

# $Env:COMPOSE_PARALLEL_LIMIT = 1

# build step
docker compose --file git-compose-from-scratch.yml --env-file .\env\git build --no-cache

# wait 5 seconds
Write-Output "Waiting 5 secs ..."
Start-Sleep -Seconds 5

# run step
docker compose --file git-compose-from-scratch.yml --env-file .\env\git up --detach

Set-Location $CWD
