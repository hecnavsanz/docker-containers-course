# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes namespace using kubectl
.\kubectl\bin\kubectl.exe create --context=$cctx `
  --save-config=true `
  -f .\labs\mod-08\kind\api\namespaces\mod-08-ns.yaml


# alternative method
#   .\kubectl\bin\kubectl.exe create namespace mod-08-ns --context=$cctx
