# pwsh
# Kubernetes Training

# create kubernetes reverse proxy to the kube-apiserver
$Env:CWD=$PWD.Path
$revpxyjob = Start-Job -Name kind-cluster-1cp-1wn-revpxy-8888 -ArgumentList $CWD `
    -ScriptBlock { `
            Param ($var) `
            & "$var\kubectl\bin\kubectl.exe" proxy `
                        --context=kind-kind-cluster-1cp-1wn --port=8888 `
        }
Receive-Job $revpxyjob
Get-Job
