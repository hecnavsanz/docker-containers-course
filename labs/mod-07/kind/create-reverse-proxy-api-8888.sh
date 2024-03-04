#!/bin/bash
# Kubernetes Training

# create the kind-1cp-1wn Kubernetes cluster reverse proxy in localhost:8888 for swagger
nohup $PWD/kubectl/bin/kubectl proxy \
    --context=kind-1cp-1wn --address=127.0.0.1 --port=8888 \
    > /tmp/kind-1cp-1wn-revpxyapijob-8888.log 2>&1 & echo $! \
    > /tmp/kind-1cp-1wn-revpxyapijob-8888.pid

# sudo sh -c "netstat -anp --tcp | grep 8888"
