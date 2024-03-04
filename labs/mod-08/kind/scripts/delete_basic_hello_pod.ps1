# pwsh
# Kubernetes Training

# remove basic hello pod using kubectl
.\kubectl\bin\kubectl.exe delete pod hello `
  --context=kind-kind-cluster-1cp-1wn --namespace=mod-02-ns
