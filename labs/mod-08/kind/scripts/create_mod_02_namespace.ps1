# pwsh
# Kubernetes Training

# create kubernetes namespace using kubectl
.\kubectl\bin\kubectl.exe create namespace mod-02-ns

# alternative method
# .\kubectl\bin\kubectl.exe create --context=kind-kind-cluster-1cp-1wn `
#   --save-config=true `
#   -f .\labs\mod-02\kind\config\namespaces\mod-02-ns.yaml
