# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes namespace using kubectl
.\kubectl\bin\kubectl.exe delete endpointslice echo-app-eps-np-svc `
    --context=$cctx --namespace=mod-08-ns
