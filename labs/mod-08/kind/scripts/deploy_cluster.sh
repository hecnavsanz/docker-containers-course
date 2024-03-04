#!/bin/bash
# Kubernetes Training

# example:
#
# sh /labs/mod-02/kind/scripts/deploy_cluster.sh cluster-1cp-1wn

# create cluster
cluster=$1
kind create cluster --name kind-${cluster} \
  --image kindest/node:v1.27.3 \
  --config ./labs/mod-02/kind/config/${cluster}/cluster.yaml
\cp -r $HOME/.kube/config ./labs/mod-02/kind/kubeconfig
