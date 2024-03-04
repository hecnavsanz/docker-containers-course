#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# delete kubernetes replication controller using kubectl
kubectl/bin/kubectl delete --context=$cctx \
  -f labs/mod-07/kind/api/replicationcontrollers/nginx-rc.yaml
# when deleting a replication controller using a yaml file, the yaml file 
#   having just in its specification the replication controller name and the namespace is enough
# when a replication controller is deleted all the pods referenced by that
#   replication controller are deleted too
# another way
#   kubectl/bin/kubectl delete replicationcontroller nginx-rc --context=$cctx --namespace=mod-07-ns
