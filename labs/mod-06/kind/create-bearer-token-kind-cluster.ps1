# pwsh
# Kubernetes Training

# Docker Kubernetes: create the ServiceAccount (admin-user) Bearer Token
.\kubectl\bin\kubectl.exe --namespace=kubernetes-dashboard `
  --context=kind-2cp-2wn create token admin-user
