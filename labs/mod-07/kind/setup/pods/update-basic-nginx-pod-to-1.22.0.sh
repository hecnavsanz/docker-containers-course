#!/bin/bash
# Kubernetes Training

# update kubernetes pod using kubectl
cctx=$(kubectl/bin/kubectl config current-context)
kubectl/bin/kubectl apply --context=$cctx --namespace=mod-07-ns \
    -f labs/mod-07/kind/api/pods/basic-nginx-1.22.0-pod.yaml
# when a pod container is updated (its image), the pod is terminated and restarted
#   but reusing the resources previously allocated (same UID, IP address, worker node ...)
# use describe command to see the events:
#   kubectl/bin/kubectl describe pod nginx --context=kind-1cp-1wn --namespace=mod-02-ns
