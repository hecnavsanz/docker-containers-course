# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes namespace using kubectl
.\kubectl\bin\kubectl.exe create namespace mod-07-ns --context=$cctx

# alternative method
# .\kubectl\bin\kubectl.exe create --context=$cctx `
#   --save-config=true `
#   -f .\labs\mod-02\kind\api\namespaces\mod-02-ns.yaml
