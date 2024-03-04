#!/bin/bash
# Kubernetes Training

# create kubernetes port forward to nginx pod
nohup kubectl port-forward --namespace mod-02-ns \
    --address localhost nginx 55000:80 > /tmp/nginx-portfwd-55000.log \
    2>&1 & echo $! > /tmp/nginx-portfwd-55000.pid
