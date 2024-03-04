# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# update kubernetes deployment using kubectl
.\kubectl\bin\kubectl.exe apply --context=$cctx `
  -f .\labs\mod-07\kind\api\deployments\echoserver-1.4-3-replicas-dp.yaml
# when a pod container is updated (its image), the pod is not recreated, the pod
#   must be deleted to let to the deployment to recreate the pod
#   to reach the deployment state (number of replicas)
# when the number of replicas is changed in a deployment, it adds or 
#   removes pods to provide the exact number of replicas that was changed
# when the image is changed its replicaset is recreated entirely by a new one (with new pods), 
#   deleting the previous replicaset (with the old pods)
