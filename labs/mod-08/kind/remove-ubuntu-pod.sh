#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# delete kubernetes ubuntu pod using kubectl
kubectl/bin/kubectl delete pod ubuntu-pod --context=$cctx --namespace=mod-08-ns
