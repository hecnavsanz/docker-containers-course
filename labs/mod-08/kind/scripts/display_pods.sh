#!/bin/bash
# Kubernetes Training

# display all namespaces
kubectl get pods --context=kind-kind-cluster-1cp-1wn \
   --namespace=mod-02-ns --output=wide