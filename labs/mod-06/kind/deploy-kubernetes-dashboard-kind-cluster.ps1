# pwsh
# Kubernetes Training

# deploy the kubernetes dashboard in the kind cluster
kubectl\bin\kubectl.exe apply --context=kind-2cp-2wn `
    -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

# create the Kubernetes cluster reverse proxy in localhost:8001 for swagger
$Env:CWD=$PWD.Path
$revpxyapijob = Start-Job -Name kind-revpxyapi-8001 -ArgumentList $Env:CWD `
    -ScriptBlock { `
            Param ($var) `
            & "$var\kubectl\bin\kubectl.exe" proxy `
                        --context=kind-2cp-2wn --port=8001 `
        }
Receive-Job $revpxyapijob
