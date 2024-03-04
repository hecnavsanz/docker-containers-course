#!/bin/bash pwsh
# Kubernetes Training

# create the kind-1cp-1wn Kubernetes cluster reverse proxy in localhost:8888 for swagger
$Env:CWD=$PWD.Path
$revpxyapijob = Start-Job -Name kind-revpxyapi-8888 -ArgumentList $Env:CWD `
    -ScriptBlock { `
            Param ($var) `
            & "$var\kubectl\bin\kubectl.exe" proxy `
                        --context=kind-1cp-1wn --address=127.0.0.1 --port=8888 `
        }
Receive-Job $revpxyapijob
# $revpxyapijob = (Get-Job -Name kind-revpxyapi-8888).Id
