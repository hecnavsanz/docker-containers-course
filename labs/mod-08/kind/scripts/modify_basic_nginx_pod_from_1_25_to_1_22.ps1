# pwsh
# Kubernetes Training

# modify basic nginx pod image from 1.25.2 to 1.22.0 using kubectl
.\kubectl\bin\kubectl.exe apply `
  --namespace=mod-02-ns --context=kind-kind-cluster-1cp-1wn `
  -f .\labs\mod-02\kind\config\pods\basic-nginx-pod-1.22.0.yaml
