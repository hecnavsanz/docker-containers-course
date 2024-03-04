#!/bin/bash
# Kubernetes Training

# setup minikube binary
curl -s -Lo /tmp/minikube-darwin-amd64 https://github.com/kubernetes/minikube/releases/download/v1.31.2/minikube-darwin-amd64
mv /tmp/minikube-darwin-amd64 $PWD/minikube/bin/minikube
chmod u+x $PWD/minikube/bin/minikube
rm -Rf /tmp/minikube-darwin-amd64

# display kind binary version
# $PWD/minikube/bin/minikube version