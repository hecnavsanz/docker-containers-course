# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes port forward
$Env:CWD=$PWD.Path
$portfwdjob = Start-Job -Name nginx-pod-55000 -ArgumentList $CWD `
    -ScriptBlock { `
            Param ($var) `
            & "$var\kubectl\bin\kubectl.exe" port-forward --context=$cctx `
                    --namespace mod-08-ns --address localhost nginx 55000:80 `
        }
Receive-Job $portfwdjob
