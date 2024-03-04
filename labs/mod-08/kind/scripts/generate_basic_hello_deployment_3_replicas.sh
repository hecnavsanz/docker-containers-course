#!/bin/bash
# Kubernetes Training

# create basic hello deployment YAML definition with 3 replicas
sed "s/replicas: 2/replicas: 3/g" \
  /labs/mod-02/kind/config/deployments/basic-hello-deployment.yaml > \
  /labs/mod-02/kind/config/deployments/basic-hello-deployment-3-replicas.yaml
