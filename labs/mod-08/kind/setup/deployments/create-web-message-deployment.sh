#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# create kubernetes deployment using kubectl
kubectl/bin/kubectl apply -f labs/mod-08/kind/api/deployments/web-message-2-reps-dp.yaml \
    --context=$cctx
