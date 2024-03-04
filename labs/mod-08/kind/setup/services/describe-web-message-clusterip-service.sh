#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# describe kubernetes service using kubectl
kubectl/bin/kubectl describe service web-message-ci-svc \
    --context=$cctx --namespace=mod-08-ns