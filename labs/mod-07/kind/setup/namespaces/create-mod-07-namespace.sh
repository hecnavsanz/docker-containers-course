#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# create kubernetes namespace using kubectl
kubectl/bin/kubectl create namespace mod-07-ns --context=$cctx

# alternative method
# kubectl/bin/kubectl create --context=$cctx \
#   --save-config=true \
#   -f labs/mod-02/kind/api/namespaces/mod-02-ns.yaml
