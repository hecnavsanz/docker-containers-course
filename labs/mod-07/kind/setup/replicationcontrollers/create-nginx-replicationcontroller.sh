#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# create kubernetes replication controller using kubectl
kubectl/bin/kubectl create --context=$cctx \
  --save-config=true \
  -f labs/mod-07/kind/api/replicationcontrollers/nginx-1.14.2-2-replicas-rc.yaml
