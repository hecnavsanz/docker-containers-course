#!/bin/bash pwsh
# Kubernetes Training

# delete the Kubernetes cluster reverse proxy from localhost:8889
Stop-Job -Name kind-revpxyapi-8889
Remove-Job -Name kind-revpxyapi-8889
Get-Job -Verbose
