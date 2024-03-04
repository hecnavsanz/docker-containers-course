#!/bin/bash
# Kubernetes Training

# delete the minikube cluster
minikube/bin/minikube delete --profile=minikube

# display the contexts (using kubectl)
kubectl/bin/kubectl config get-contexts
