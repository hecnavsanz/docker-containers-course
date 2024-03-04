#!/bin/bash
# Kubernetes Training

# delete kubernetes reverse proxy to the kube-apiserver
pkill -F /tmp/kind-cluster-1cp-1wn-revpxy-8888.pid
rm -Rf /tmp/kind-cluster-1cp-1wn-revpxy-8888.pid
