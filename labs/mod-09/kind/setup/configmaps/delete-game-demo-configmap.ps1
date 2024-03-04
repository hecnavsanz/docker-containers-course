# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# delete kubernetes configmap using kubectl
.\kubectl\bin\kubectl.exe delete configmap game-demo-cm `
    --context=$cctx --namespace=mod-09-ns
