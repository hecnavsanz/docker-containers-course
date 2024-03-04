#!/bin/bash
# Kubernetes Training

# deploy the kubernetes dashboard in the kind cluster
kubectl/bin/kubectl apply --context=kind-2cp-2wn \
    -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

# create the Kubernetes cluster reverse proxy in localhost:8001 for swagger
nohup $PWD/kubectl/bin/kubectl proxy \
    --context=kind-2cp-2wn --address=192.168.2.111 --port=8001 \
    > /tmp/kind-2cp-2wn-revpxyapijob-8001.log 2>&1 & echo $! \
    > /tmp/kind-2cp-2wn-revpxyapijob-8001.pid
