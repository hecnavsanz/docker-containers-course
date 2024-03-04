#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# delete kubernetes pod using kubectl
kubectl/bin/kubectl delete pods echo-pod-1 echo-pod-2 \
    --context=$cctx --namespace=mod-08-ns
