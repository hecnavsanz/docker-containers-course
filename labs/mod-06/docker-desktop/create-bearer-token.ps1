# pwsh
# Kubernetes Training

# Docker Kubernetes: create the ServiceAccount (admin-user) Bearer Token
.\kubectl\bin\kubectl.exe --namespace=kubernetes-dashboard `
  --context=docker-desktop create token admin-user