# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes pod using kubectl
.\kubectl\bin\kubectl.exe create --context=$cctx `
  --save-config=true `
  -f .\labs\mod-09\kind\api\pods\ubuntu-empty-dir-pod.yaml
