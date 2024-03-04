# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes pods using kubectl
.\kubectl\bin\kubectl.exe create --context=$cctx `
  --save-config=true `
  -f .\labs\mod-08\kind\api\pods\echoserver-1.10-pods.yaml
