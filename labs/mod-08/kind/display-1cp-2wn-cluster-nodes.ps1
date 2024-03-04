# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# display cluster nodes
.\kubectl\bin\kubectl.exe --context=$cctx get nodes --output=wide
