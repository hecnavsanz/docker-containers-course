# pwsh
# Kubernetes Training

# create the kind cluster
.\kind\bin\kind.exe create cluster

# display the contexts (using kubectl)
.\kubectl\bin\kubectl.exe config get-contexts

# display the kind cluster information (using kubectl)
.\kubectl\bin\kubectl.exe cluster-info --context=kind-kind
  