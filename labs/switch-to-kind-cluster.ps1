# pwsh
# Kubernetes Training

# example: nodes include control plane and worker nodes 
#   .\labs\switch-to-kind-cluster.ps1 2cp-2wn

# Set a Kubernetes Kind cluster as the current Kubernetes cluster
$cluster=$Args[0]
.\kubectl\bin\kubectl.exe config use-context kind-$cluster
.\kubectl\bin\kubectl.exe config get-contexts
