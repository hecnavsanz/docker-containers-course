#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# create kubernetes ubuntu pod using kubectl
kubectl/bin/kubectl create --context=$cctx \
  --save-config=true \
  -f labs/mod-08/kind/api/pods/ubuntu-pod.yaml
sleep 10

kubectl/bin/kubectl exec ubuntu-pod -c ubu-cntr -i -t \
    --context=$cctx --namespace=mod-08-ns \
    -- apt update -y

kubectl/bin/kubectl exec ubuntu-pod -c ubu-cntr -i -t \
    --context=$cctx --namespace=mod-08-ns \
    -- apt install curl -y

kubectl/bin/kubectl get pod ubuntu-pod --context=$cctx --namespace=mod-08-ns --output=wide
