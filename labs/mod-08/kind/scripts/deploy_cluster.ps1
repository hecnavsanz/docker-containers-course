# pwsh
# Kubernetes Training

# example:
#
# .\labs\mod-02\kind\scripts\deploy_cluster.ps1 cluster-1cp-1wn

# create cluster
$cluster=$Args[0]
.\kind\bin\kind.exe create cluster --name kind-$cluster `
--image kindest/node:v1.27.3 `
  --config .\labs\mod-02\kind\config\$cluster\cluster.yaml
