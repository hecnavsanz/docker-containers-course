# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# update kubernetes pod using kubectl
.\kubectl\bin\kubectl.exe apply --context=$cctx `
  -f .\labs\mod-07\kind\api\pods\echoserver-1.10-pod.yaml
# the pod is restarted (recreated) when the pod spec is changed (in the
#   yaml definition file) keeping the pod uid in the cluster.
