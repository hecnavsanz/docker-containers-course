#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# update kubernetes replicaset using kubectl
kubectl/bin/kubectl apply --context=$cctx \
  -f labs/mod-07/kind/api/replicasets/nginx-1.25.2-3-replicas-rs.yaml
# when a pod container is updated (its image), the pod is not recreated, the pod
#   must be deleted to let to the replicaset to recreate the pod
#   to reach the replicaset state (number of replicas)
# when the number of replicas is changed in a replicaset, it adds or 
#   removes pods to provide the exact number of replicas that was changed
# when the image and the number of replicas is changed it could have pods with old images
#   and pods with new images
