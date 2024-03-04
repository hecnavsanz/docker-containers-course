#!/bin/bash
# Kubernetes Training

# Docker Kubernetes: create the ServiceAccount (admin-user) Bearer Token
kubectl/bin/kubectl --namespace=kubernetes-dashboard \
  --context=docker-desktop create token admin-user