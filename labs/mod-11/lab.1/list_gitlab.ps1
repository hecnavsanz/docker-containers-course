# pwsh

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
$dockerPath = (Get-Command -Name docker.exe).Source
Write-Output "- GitLab Project:"
& "$dockerPath" compose ls --all
Write-Output "- GitLab Network:"
& "$dockerPath" network ls --filter name=gitlab-bridge
Write-Output "- GitLab Volumes:"
& "$dockerPath" volume ls --filter name=gitlab
