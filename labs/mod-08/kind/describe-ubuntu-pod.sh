#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# describe kubernetes ubuntu pod using kubectl
kubectl/bin/kubectl describe pod ubuntu-pod --context=$cctx --namespace=mod-08-ns
