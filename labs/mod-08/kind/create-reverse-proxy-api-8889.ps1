#!/bin/bash pwsh
# Kubernetes Training

# create the Kubernetes cluster reverse proxy in localhost:8889 for swagger
$Env:CWD=$PWD.Path
$revpxyapijob = Start-Job -Name kind-revpxyapi-8889 -ArgumentList $Env:CWD `
    -ScriptBlock { `
            Param ($var) `
            & "$var\kubectl\bin\kubectl.exe" proxy `
                        --context=kind-1cp-2wn --address=127.0.0.1 --port=8889 `
        }
Receive-Job $revpxyapijob
# $revpxyapijob = (Get-Job -Name kind-revpxyapi-8889).Id
