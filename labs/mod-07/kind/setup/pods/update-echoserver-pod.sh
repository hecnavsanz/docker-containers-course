#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# update kubernetes pod using kubectl
kubectl/bin/kubectl apply --context=$cctx \
  -f labs/mod-07/kind/api/pods/echoserver-1.10-pod.yaml
# the pod is restarted (recreated) when the pod spec is changed (in the
#   yaml definition file) keeping the pod uid in the cluster.
