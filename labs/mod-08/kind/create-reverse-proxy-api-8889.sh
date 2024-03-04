#!/bin/bash
# Kubernetes Training

# create Kubernetes cluster reverse proxy in localhost:8889
nohup $PWD/kubectl/bin/kubectl proxy \
    --context=kind-1cp-2wn --address=127.0.0.1 --port=8889 \
    > /tmp/kind-1cp-2wn-revpxyapijob-8889.log 2>&1 & echo $! \
    > /tmp/kind-1cp-2wn-revpxyapijob-8889.pid

# sudo sh -c "netstat -anp --tcp | grep 8888"
