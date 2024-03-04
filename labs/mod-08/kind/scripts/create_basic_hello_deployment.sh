#!/bin/bash
# Kubernetes Training

# create basic hello deployment using kubectl
kubectl create --context=kind-kind-cluster-1cp-1wn \
  --namespace=mod-02-ns --save-config=true \
  -f ./labs/mod-02/kind/config/deployments/basic-hello-deployment.yaml
