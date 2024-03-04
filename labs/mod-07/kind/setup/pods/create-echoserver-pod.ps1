# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes pod using kubectl
.\kubectl\bin\kubectl.exe create --context=$cctx `
  --save-config=true `
  -f .\labs\mod-07\kind\api\pods\echoserver-1.4-pod.yaml
# the pod with the pod name must not exists, if not you get the error:
#   Error from server (AlreadyExists): error when creating "<dir>\<pod>.yaml": 
#     pods "<pod-name>" already exists.
