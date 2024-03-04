#!/bin/bash
# Kubernetes Training

# example:
#
# sh /labs/mod-02/kind/scripts/display_cluster.sh cluster-1cp-1wn

# display cluster
cluster=$1
kubectl cluster-info --context kind-kind-${cluster}
