# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# delete kubernetes replication controller using kubectl
.\kubectl\bin\kubectl.exe delete --context=$cctx `
  -f .\labs\mod-07\kind\api\replicationcontrollers\nginx-rc.yaml
# when deleting a replication controller using a yaml file, the yaml file 
#   having just in its specification the replication controller name and the namespace is enough
# when a replication controller is deleted all the pods referenced by that
#   replication controller are deleted too
# another way
#   .\kubectl\bin\kubectl.exe delete replicationcontroller nginx-rc --context=$cctx --namepsace=mod-07-ns
