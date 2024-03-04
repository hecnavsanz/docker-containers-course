# pwsh
# Kubernetes Training

# create kubernetes reverse proxy to the kube-apiserver for swagger
$Env:CWD=$PWD.Path
$revpxyswgjob = Start-Job -Name swagger-revpxy-8001 -ArgumentList $CWD `
    -ScriptBlock { `
            Param ($var) `
            & "$var\kubectl\bin\kubectl.exe" proxy `
                        --context=kind-kind-cluster-1cp-1wn --port=8001 `
        }
Receive-Job $revpxyswgjob
Get-Job
