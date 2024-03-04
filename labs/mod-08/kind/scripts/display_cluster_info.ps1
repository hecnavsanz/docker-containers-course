# pwsh
# Kubernetes Training

# example:
#
# .\labs\mod-02\kind\scripts\display_cluster.ps1 cluster-1cp-1wn

# display cluster
$cluster=$Args[0]
.\kubectl\bin\kubectl.exe cluster-info --context kind-kind-$cluster
