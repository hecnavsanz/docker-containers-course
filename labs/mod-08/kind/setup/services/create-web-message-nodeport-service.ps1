# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes service using kubectl
.\kubectl\bin\kubectl.exe create --context=$cctx `
  --save-config=true `
  -f .\labs\mod-08\kind\api\services\web-message-np-svc.yaml
