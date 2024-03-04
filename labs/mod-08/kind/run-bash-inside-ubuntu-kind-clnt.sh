#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# run a bash inside ubuntu kind client
docker exec -it $(docker ps -q --filter name=ubuntu-kind-clnt) bash

# test echo-pod-1, echo-pod-2 and echo-app-ep-np-svc inside cluster will not work because
#   this ubuntu kind container is outside the cluster (is not a cp or wn) but is connected
#   to the same kind network as the cp and wns.

# test echo-app-ep-np-svc outside cluster
#   replace 172.19.0.3 and 172.19.0.4 for your assigned host IP addresses when deploying the
#   kind-1cp-2wn cluster
#     $ for i in {1..5}; do   echo "Loop ${i}: $(curl -s http://172.19.0.4:30001 | grep Hostname)"; done
#     $ for i in {1..5}; do   echo "Loop ${i}: $(curl -s http://172.19.0.3:30001 | grep Hostname)"; done
