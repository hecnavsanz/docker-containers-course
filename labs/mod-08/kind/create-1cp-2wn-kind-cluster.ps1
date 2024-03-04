#!/bin/bash pwsh
# Kubernetes Training

# create the kind cluster
.\kind\bin\kind.exe create cluster --name=1cp-2wn `
    --config=labs/mod-08/kind/config/cluster-1cp-2wn.yaml

# display the contexts (using kubectl)
.\kubectl\bin\kubectl.exe config get-contexts

# display the kind cluster information (using kubectl)
.\kubectl\bin\kubectl.exe cluster-info --context=kind-1cp-2wn