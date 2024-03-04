#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# display kubernetes replication controller using kubectl
kubectl/bin/kubectl get replicationcontroller nginx-rc \
  --context=$cctx --namespace=mod-07-ns
