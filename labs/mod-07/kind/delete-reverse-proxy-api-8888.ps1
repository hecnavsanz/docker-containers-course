#!/bin/bash pwsh
# Kubernetes Training

# delete the Kubernetes cluster reverse proxy from localhost:8888
Stop-Job -Name kind-revpxyapi-8888
Remove-Job -Name kind-revpxyapi-8888
Get-Job -Verbose
