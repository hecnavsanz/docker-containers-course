# pwsh
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
$dockerPath = (Get-Command -Name docker.exe).Source
& "$dockerPath" compose --file compose-gitlab.yaml --env-file ./env/.env up --pull missing --detach