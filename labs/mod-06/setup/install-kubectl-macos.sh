#!/bin/bash
# Kubernetes Training

# setup minikube binary
curl -s -Lo kubectl/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
chmod u+x kubectl/bin/kubectl

# display kubectl binary version
# kubectl/bin/kubectl version --output=yaml
