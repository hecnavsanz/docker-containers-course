# pwsh
# Kubernetes Training

# display all deployments
.\kubectl\bin\kubectl.exe get deployments `
  --context=kind-kind-cluster-1cp-1wn --namespace=mod-02-ns --output=wide
