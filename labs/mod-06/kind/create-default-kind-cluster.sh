#!/bin/bash
# Kubernetes Training

# create the kind cluster
kind/bin/kind create cluster

# display the contexts (using kubectl)
kubectl/bin/kubectl config get-contexts

# display the kind cluster information (using kubectl)
kubectl/bin/kubectl cluster-info --context=kind-kind
  