#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# display kubernetes replicaset using kubectl
kubectl/bin/kubectl get replicaset nginx-rs \
  --context=$cctx --namespace=mod-07-ns
