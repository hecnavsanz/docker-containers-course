# pwsh
# Kubernetes Training

# get current context
cctx=$(kubectl/bin/kubectl config current-context)

# display cluster configuration
kubectl/bin/kubectl cluster-info --context=$cctx
# in kind the cluster name (context) is kind-<cluster-name> but the cluster name
#   internally is just <cluster-name>.
