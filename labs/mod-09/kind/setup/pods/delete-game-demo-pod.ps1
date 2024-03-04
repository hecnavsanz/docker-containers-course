# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# delete kubernetes pod using kubectl
.\kubectl\bin\kubectl.exe delete pod game-demo-pod `
    --context=$cctx --namespace=mod-09-ns
