# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# delete kubernetes pods using kubectl
.\kubectl\bin\kubectl.exe delete pods echo-pod-1 echo-pod-2 `
    --context=$cctx --namespace=mod-08-ns
