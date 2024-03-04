# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# display kubernetes replicaset using kubectl
.\kubectl\bin\kubectl.exe get replicaset nginx-rs `
  --context=$cctx --namespace=mod-07-ns
