# pwsh
# Kubernetes Training

# describe basic hello deployment details using kubectl
.\kubectl\bin\kubectl.exe describe deployment hello-dp `
  --context=kind-kind-cluster-1cp-1wn --namespace=mod-02-ns 

# .\kubectl\bin\kubectl.exe describe deployments/hello-dp `
#   --context=kind-kind-cluster-1cp-1wn --namespace=mod-02-ns 