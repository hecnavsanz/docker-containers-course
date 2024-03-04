#!/bin/bash
# Kubernetes Training

# install kind binary
[ $(uname -m) = x86_64 ] && curl -s -Lo kind/bin/kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-darwin-amd64
chmod u+x kind/bin/kind

# display kind binary version
# kind/bin/kind version
