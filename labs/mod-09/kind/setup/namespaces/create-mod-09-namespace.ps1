# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes namespace using kubectl
.\kubectl\bin\kubectl.exe create --context=$cctx `
  --save-config=true `
  -f .\labs\mod-09\kind\api\namespaces\mod-09-ns.yaml


# alternative method
#   .\kubectl\bin\kubectl.exe create namespace mod-09-ns --context=$cctx
