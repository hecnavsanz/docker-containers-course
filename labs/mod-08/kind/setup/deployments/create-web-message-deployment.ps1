# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes deployment using kubectl
.\kubectl\bin\kubectl.exe apply -f labs\mod-08\kind\api\deployments\web-message-2-reps-dp.yaml `
    --context=$cctx
