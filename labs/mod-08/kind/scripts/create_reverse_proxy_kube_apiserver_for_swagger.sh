#!/bin/bash
# Kubernetes Training

# create kubernetes reverse proxy to the kube-apiserver for swagger
nohup kubectl proxy \
    --context=kind-kind-cluster-1cp-1wn --port=8001 \
    > /tmp/revpxyapiswg.log 2>&1 & echo $! \
    > /tmp/revpxyapiswg.pid
