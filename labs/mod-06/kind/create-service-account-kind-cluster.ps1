# pwsh
# Kubernetes Training

# Docker Kubernetes: create the ServiceAccount (admin-user)
.\kubectl\bin\kubectl.exe apply --context=kind-2cp-2wn `
    -f labs\mod-06\kind\config\dashboard-admin-user.yaml

# in case the above account is not enough (Forbidden), just for testing
#    enable the anonymous access to the dashboard
.\kubectl\bin\kubectl.exe apply --context=kind-2cp-2wn `
    -f labs\mod-06\kind\config\dashboard-anonymous-user.yaml
