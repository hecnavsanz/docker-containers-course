# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes endpoints using kubectl
.\kubectl\bin\kubectl.exe apply -f labs\mod-08\kind\api\endpointslices\echoserver-eps.yaml `
    --context=$cctx
