# pwsh
# Kubernetes Training

# create kubernetes port forward to nginx pod
$Env:CWD=$PWD.Path
$portfwdjob = Start-Job -Name nginx-pod-55000 -ArgumentList $CWD `
    -ScriptBlock { `
            Param ($var) `
            & "$var\kubectl\bin\kubectl.exe" port-forward `
                    --namespace mod-02-ns --address localhost nginx 55000:80 `
        }
Receive-Job $portfwdjob
Get-Job
