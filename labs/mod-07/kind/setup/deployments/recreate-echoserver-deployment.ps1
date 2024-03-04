# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# recreate kubernetes deployment using kubectl
.\kubectl\bin\kubectl.exe replace --force --context=$cctx `
  --save-config=true `
  -f .\labs\mod-07\kind\api\deployments\echoserver-1.4-2-replicas-dp.yaml
# without --force acts like a `kubectl.exe apply`
