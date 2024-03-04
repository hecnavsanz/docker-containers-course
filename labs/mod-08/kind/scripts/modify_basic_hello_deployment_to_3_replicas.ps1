# pwsh
# Kubernetes Training

# modify basic hello deployment from 2 to 3 replicas using kubectl
.\kubectl\bin\kubectl.exe apply `
  --context=kind-kind-cluster-1cp-1wn --namespace=mod-02-ns `
  -f .\labs\mod-02\kind\config\deployments\basic-hello-deployment-3-replicas.yaml
