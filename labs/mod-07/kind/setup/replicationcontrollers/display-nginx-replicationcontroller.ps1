# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# display kubernetes replication controller using kubectl
.\kubectl\bin\kubectl.exe get replicationcontroller nginx-rc `
  --context=$cctx --namespace=mod-07-ns
