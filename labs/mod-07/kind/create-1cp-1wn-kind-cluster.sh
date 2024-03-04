#!/bin/bash
# Kubernetes Training

# create the kind cluster
kind/bin/kind create cluster --name=1cp-1wn \
    --config=labs/mod-07/kind/config/cluster-1cp-1wn.yaml

# display the contexts (using kubectl)
kubectl/bin/kubectl config get-contexts

# display the kind cluster information (using kubectl)
kubectl/bin/kubectl cluster-info --context=kind-1cp-1wn
  