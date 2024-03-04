#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# create kubernetes configmap using kubectl
kubectl/bin/kubectl create --context=$cctx \
  --save-config=true \
  -f labs/mod-09/kind/api/configmaps/game-demo-cm.yaml
