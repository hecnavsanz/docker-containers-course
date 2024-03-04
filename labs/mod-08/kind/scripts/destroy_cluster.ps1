# pwsh
# Kubernetes Training

# example:
#
# .\labs\mod-02\kind\scripts\destroy_cluster.ps1 cluster-1cp-1wn

# remove cluster
$cluster=$Args[0]
.\kind\bin\kind.exe delete cluster --name kind-$cluster
