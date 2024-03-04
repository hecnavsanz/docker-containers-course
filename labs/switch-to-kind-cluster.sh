#!/bin/bash
# Kubernetes Training

# example: nodes include control plane and worker nodes 
#   sh /labs/switch-to-kind-cluster 2cp-2wn

# Set a Kubernetes Kind cluster as the current Kubernetes cluster
cluster=$1
kubectl/bin/kubectl config use-context kind-$cluster
kubectl/bin/kubectl config get-contexts
