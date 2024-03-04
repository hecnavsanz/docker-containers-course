# pwsh
# Kubernetes Training

# display all pods
.\kubectl\bin\kubectl.exe get pods `
  --context=kind-kind-cluster-1cp-1wn --namespace=mod-02-ns --output=wide
