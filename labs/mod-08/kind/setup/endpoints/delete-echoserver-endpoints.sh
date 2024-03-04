#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# delete kubernetes endpoints using kubectl
kubectl/bin/kubectl delete endpoints echo-app-ep-np-svc \
    --context=$cctx --namespace=mod-08-ns
# if the endpoints is deleted but the service that was mapping it is not, then
#   a new endpoints is created
