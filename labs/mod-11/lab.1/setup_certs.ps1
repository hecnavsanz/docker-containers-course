# pwsh
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
$dockerPath = (Get-Command -Name docker.exe).Source
Remove-Item -Force -Recurse .\cert\registry\*
Remove-Item -Force -Recurse .\auth\registry\*
& "$dockerPath" build --no-cache --tag gitlab-tls .\config\tls
& "$dockerPath" run --rm --mount type=bind,source="$(Get-Location)"/cert/registry,target=/app --name gitlab-tls gitlab-tls req -newkey rsa:2048 -nodes -keyout /app/core.io.key -x509 -days 365 -out /app/core.io.crt -subj '/C=ES/ST=core/L=Valencia/O=Training/CN=gitlab-registry.core.io'
& "$dockerPath" run --rm --entrypoint htpasswd httpd:2 -Bbn admin core.2FORMACION | Set-Content -Encoding ASCII ./auth/registry/htpasswd