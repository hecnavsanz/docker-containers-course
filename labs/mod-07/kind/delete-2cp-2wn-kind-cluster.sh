#!/bin/bash
# Kubernetes Training

# delete the kind cluster
kind/bin/kind delete cluster --name=2cp-2wn

# display the contexts (using kubectl)
kubectl/bin/kubectl config get-contexts
