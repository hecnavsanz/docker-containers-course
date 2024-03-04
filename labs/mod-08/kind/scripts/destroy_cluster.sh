#!/bin/bash
# Kubernetes Training

# example:
#
# sh /labs/mod-02/kind/scripts/destroy_cluster.sh cluster-1cp-1wn

# delete cluster
cluster=$1
kind delete cluster --name kind-${cluster}
rm -Rf $HOME/.kube/config ./labs/mod-02/kind/kubeconfig/config
