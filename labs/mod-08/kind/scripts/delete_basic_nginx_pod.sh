#!/bin/bash
# Kubernetes Training

# remove basic nginx pod using kubectl
kubectl delete pod nginx \
  --context=kind-kind-cluster-1cp-1wn --namespace=mod-02-ns
