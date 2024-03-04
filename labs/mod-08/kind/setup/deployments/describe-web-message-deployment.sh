#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# describe kubernetes deployment using kubectl
kubectl/bin/kubectl describe deployment web-message-dp \
    --context=$cctx --namespace=mod-08-ns
