# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# display cluster configuration including the cluster name
.\kubectl\bin\kubectl.exe cluster-info --context=$cctx
