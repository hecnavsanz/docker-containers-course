#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# create kubernetes endpoints using kubectl
kubectl/bin/kubectl apply -f labs/mod-08/kind/api/endpoints/echoserver-ep.yaml \
    --context=$cctx
