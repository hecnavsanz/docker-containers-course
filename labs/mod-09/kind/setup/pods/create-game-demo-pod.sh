#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# create kubernetes pod using kubectl
kubectl/bin/kubectl create --context=$cctx \
  --save-config=true \
  -f labs/mod-09/kind/api/pods/game-demo-pod.yaml
