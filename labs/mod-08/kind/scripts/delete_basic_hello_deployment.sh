#!/bin/bash
# Kubernetes Training

# remove basic hello deployment using kubectl
kubectl delete deployment hello-dp \
  --context=kind-kind-cluster-1cp-1wn --namespace=mod-02-ns
