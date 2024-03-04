#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# recreate kubernetes deployment using kubectl
kubectl/bin/kubectl replace --force --context=$cctx \
  --save-config=true \
  -f labs/mod-07/kind/api/deployments/echoserver-1.4-2-replicas-dp.yaml
# without --force acts like a `kubectl apply`
