#!/bin/bash
# Kubernetes Training

# create the kind cluster
kind/bin/kind create cluster --name=2cp-2wn \
    --config=labs/mod-06/kind/config/cluster-2cp-2wn.yaml

# display the contexts (using kubectl)
kubectl/bin/kubectl config get-contexts

# display the kind cluster information (using kubectl)
kubectl/bin/kubectl cluster-info --context=kind-2cp-2wn
  