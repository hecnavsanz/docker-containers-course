# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes namespace using kubectl
.\kubectl\bin\kubectl.exe delete service echo-app-ep-np-svc `
    --context=$cctx --namespace=mod-08-ns
# when a service is deleted, the mapped endpoints are deleted too (cascade)
