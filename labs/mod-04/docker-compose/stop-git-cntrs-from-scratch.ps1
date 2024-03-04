# pwsh
# stop git docker containers

$CWD = $PWD.Path
Set-Location "$CWD\devops"

# stop the git HTTP(S) server systemd services
docker exec -it git-server sudo -u core sh -c "sh /labs/mod-07/git/scripts/stop-git-http-server.sh"
# wait for 20 secs ...
Start-Sleep -Seconds 20
# stop the git docker containers (can be started later to continue in the last state were left)
docker compose --file git-compose-from-scratch.yml --env-file .\env\git stop

Set-Location "$CWD"
