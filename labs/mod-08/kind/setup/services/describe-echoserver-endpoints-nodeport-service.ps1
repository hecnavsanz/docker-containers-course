# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# describe kubernetes service using kubectl
.\kubectl\bin\kubectl.exe describe service echo-app-ep-np-svc `
    --context=$cctx --namespace=mod-08-ns