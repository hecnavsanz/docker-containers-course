#!/bin/bash
# Kubernetes Training

# modify basic nginx pod image from 1.25.2 to 1.22.0 using kubectl
kubectl apply \
  --context=kind-kind-cluster-1cp-1wn --namespace=mod-02-ns \
  -f ./labs/mod-02/kind/config/deployments/basic-nginx-pod-1.22.0.yaml
