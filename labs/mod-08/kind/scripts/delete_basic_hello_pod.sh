#!/bin/bash
# Kubernetes Training

# remove basic hello pod using kubectl
kubectl delete pod hello \
  --context=kind-kind-cluster-1cp-1wn --namespace=mod-02-ns
