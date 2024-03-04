#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# delete kubernetes deployment using kubectl
kubectl/bin/kubectl delete --context=$cctx \
  -f labs/mod-07/kind/api/deployments/echoserver-dp.yaml
# when deleting a deployment using a yaml file, the yaml file 
#   having just in its specification the deployment name and the namespace is enough
# when a deployment is deleted all the pods referenced by that
#   deployment are deleted too
# another way
#   kubectl/bin/kubectl delete deployment echoserver-dp --context=$cctx
