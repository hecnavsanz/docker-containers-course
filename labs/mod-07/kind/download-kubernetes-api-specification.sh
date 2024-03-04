#!/bin/bash
# Kubernetes Training

# download the kubernetes api specification from the kube-apiserver
curl -s -Lo ./labs/mod-07/kind/api/kubernetes-api-swagger.json \
    http://127.0.0.1:8001/openapi/v2
