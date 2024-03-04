#!/bin/bash
# Kubernetes Training

# display kubernetes pods using REST API (GET)
cctx=$(kubectl/bin/kubectl config current-context)
kubectl/bin/kubectl get pods --context=$cctx --namespace=mod-08-ns --output=wide
