#!/bin/bash
# Kubernetes Training

# create the minikube cluster
minikube/bin/minikube start --driver=docker --kubernetes-version=stable

# display the minikube profile
minikube/bin/minikube profile list  

# display the minikube context (using minikube)
minikube/bin/minikube kubectl -- config get-contexts

# display the contexts (using kubectl)
kubectl/bin/kubectl config get-contexts

# display the minikube cluster information (using kubectl)
kubectl/bin/kubectl cluster-info --context=minikube
