#!/bin/bash
# Kubernetes Training

# Docker Kubernetes: create the ServiceAccount (admin-user)
kubectl/bin/kubectl apply --context=docker-desktop \
    -f labs/mod-06/docker-desktop/config/dashboard-admin-user.yaml
