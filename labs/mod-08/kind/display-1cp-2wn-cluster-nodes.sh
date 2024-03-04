# pwsh
# Kubernetes Training

# get current context
cctx=$(kubectl/bin/kubectl config current-context)

# display cluster nodes
kubectl/bin/kubectl --context=$cctx get nodes --output=wide
