#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# delete kubernetes configmap using kubectl
kubectl/bin/kubectl delete configmap game-demo-cm \
    --context=$cctx --namespace=mod-09-ns
