# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# delete kubernetes replicaset using kubectl
.\kubectl\bin\kubectl.exe delete --context=$cctx `
  -f .\labs\mod-07\kind\api\replicasets\nginx-rs.yaml
# when deleting a replicaset using a yaml file, the yaml file 
#   having just in its specification the replicaset name and the namespace is enough
# when a replicaset is deleted all the pods referenced by that
#   replicaset are deleted too
# another way
#   .\kubectl\bin\kubectl.exe delete replicaset nginx-rs `
#      --context=$cctx --namespace=mod-07-ns
