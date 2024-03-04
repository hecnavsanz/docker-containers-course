#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# create kubernetes namespace using kubectl
kubectl/bin/kubectl delete namespace mod-08-ns --context=$cctx
