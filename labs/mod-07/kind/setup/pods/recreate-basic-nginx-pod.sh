#!/bin/bash
# Kubernetes Training

# recreate kubernetes pod using REST API (POST with JSON)
cctx=$(kubectl/bin/kubectl config current-context)
kubectl/bin/kubectl replace --force --context=$cctx --namespace=mod-07-ns \
  --save-config=true \
  -f labs/mod-07/kind/api/pods/basic-nginx-1.25.2-pod-with-label.yaml
# without --force an error is displayed and the pod is not recreated when trying to replace 
#   the container image or labels:
#     The Pod "<pod-name>" is invalid: spec: Forbidden: pod updates may not change fields other than 
#       `spec.containers[*].image`,`spec.initContainers[*].image`,`spec.activeDeadlineSeconds`,
#       `spec.tolerations` (only additions to existing tolerations),`spec.terminationGracePeriodSeconds` 
#       (allow it to be set to 1 if it was previously negative)
