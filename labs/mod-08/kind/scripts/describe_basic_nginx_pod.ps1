# pwsh
# Kubernetes Training

# describe basic nginx pod details using kubectl
.\kubectl\bin\kubectl.exe describe pods/nginx `
  --context=kind-kind-cluster-1cp-1wn --namespace=mod-02-ns

# .\kubectl\bin\kubectl.exe describe pods nginx `
#   --context=kind-kind-cluster-1cp-1wn --namespace=mod-02-ns
