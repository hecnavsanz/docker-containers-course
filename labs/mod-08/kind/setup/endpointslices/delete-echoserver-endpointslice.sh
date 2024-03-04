#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# delete kubernetes endpoints using kubectl
kubectl/bin/kubectl delete endpointslice echo-app-eps-np-svc \
    --context=$cctx --namespace=mod-08-ns
