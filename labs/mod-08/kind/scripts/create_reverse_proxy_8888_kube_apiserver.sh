#!/bin/bash
# Kubernetes Training

# create kubernetes reverse proxy to the kube-apiserver
nohup kubectl proxy --context=kind-kind-cluster-1cp-1wn \
    --port=8888 > /tmp/kind-cluster-1cp-1wn-revpxy-8888.log \
    2>&1 & echo $! > /tmp/kind-cluster-1cp-1wn-revpxy-8888.pid
