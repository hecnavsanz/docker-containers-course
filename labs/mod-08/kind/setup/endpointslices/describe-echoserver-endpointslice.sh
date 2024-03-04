#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# describe kubernetes endpoints using kubectl
kubectl/bin/kubectl describe endpointslice echo-app-eps-np-svc \
    --context=$cctx --namespace=mod-08-ns
