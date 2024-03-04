# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes service using kubectl
.\kubectl\bin\kubectl.exe delete service echo-app-ep-np-svc `
    --context=$cctx --namespace=mod-08-ns
# if the endpoints is deleted but the service that was mapping it is not, then
#   a new endpoints is created
