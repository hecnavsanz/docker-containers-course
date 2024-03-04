# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# delete kubernetes namespace using kubectl
.\kubectl\bin\kubectl.exe delete namespace mod-08-ns --context=$cctx
