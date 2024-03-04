#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# delete kubernetes pod using kubectl
kubectl/bin/kubectl delete pod echo-pod --context=$cctx --namespace=mod-07-ns

# another way
# kubectl/bin/kubectl delete --context=$cctx \
#   -f labs/mod-07/kind/api/pods/echoserver-pod.yaml
# when deleting a pod using a yaml definition file, kubernetes only gets the name
#   and the namespace to delete it, doesnt matter if the rest of the definition matches
#   or not with the definition of the running pod to be deleted. indeed the yaml file
#   should have just the pod name and the namespace (or provide the namespace in the
#   command line and just only the pod name).
