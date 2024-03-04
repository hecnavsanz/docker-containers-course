#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# create kubernetes port forward
nohup $PWD/kubectl/bin/kubectl port-forward --context=$cctx  \
  --namespace mod-07-ns --address localhost nginx 55000:80 \
    > /tmp/basic-nginx-pod-portforwardjob-55000.log 2>&1 & echo $! \
    > /tmp/basic-nginx-pod-portforwardjob-55000.pid

# sudo sh -c "netstat -anp --tcp | grep 55000"
