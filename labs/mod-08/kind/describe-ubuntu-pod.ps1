# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# describe kubernetes ubuntu pod using kubectl
.\kubectl\bin\kubectl.exe describe pod ubuntu-pod --context=$cctx --namespace=mod-08-ns
