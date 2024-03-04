#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# delete kubernetes pod using kubectl
kubectl/bin/kubectl delete pod game-demo-pod \
    --context=$cctx --namespace=mod-09-ns
