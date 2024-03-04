#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# create kubernetes endpoints using kubectl
kubectl/bin/kubectl apply -f labs/mod-08/kind/api/endpointslices/echoserver-eps.yaml \
    --context=$cctx
