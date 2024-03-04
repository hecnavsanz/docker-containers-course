# pwsh
# start jenkins docker containers

$CWD = $PWD.Path
Set-Location "$CWD\devops"

# start the jenkins containers in the last state were left (can be stopped later)
docker compose --file jenkins-compose-from-scratch.yml --env-file .\env\jenkins start jenkins-srv
docker compose --file jenkins-compose-from-scratch.yml --env-file .\env\jenkins start jenkins-agt
docker compose --file jenkins-compose-from-scratch.yml --env-file .\env\jenkins start jenkins-dev

Set-Location "$CWD"
