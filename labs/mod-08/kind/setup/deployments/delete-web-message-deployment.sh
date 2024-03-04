#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# delete kubernetes deployment using kubectl
kubectl/bin/kubectl delete deployment web-message-dp \
    --context=$cctx --namespace=mod-08-ns
