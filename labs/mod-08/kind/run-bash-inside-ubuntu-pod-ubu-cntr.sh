#!/bin/bash
# Kubernetes Training

# get the current context
cctx=$(kubectl/bin/kubectl config current-context)

# run a bash inside ubuntu container in ubuntu pod using kubectl
kubectl/bin/kubectl exec ubuntu-pod -c ubu-cntr -i -t \
    --context=$cctx --namespace=mod-08-ns \
    -- bash

# test echo-pod-1
#   replace 10.244.1.4 by the echo-pod-1 pod IP address assigned in your laptop to the pod
#   when deployed it was deployed in the kind-1cp-2wn cluster
#      $ for i in {1..5}; do echo "Loop ${i}: $(curl -s http://10.244.1.4:8080 | grep Hostname)"; sleep 1; done
# test echo-pod-2
#   replace 10.244.2.4 by the echo-pod-2 pod IP address assigned in your laptop to the pod
#   when deployed it was deployed in the kind-1cp-2wn cluster
#      $ for i in {1..5}; do echo "Loop ${i}: $(curl -s http://10.244.2.4:8080 | grep Hostname)"; sleep 1; done
# test echo-app-ep-np-svc inside cluster
#   replace 10.111.39.114 by the echo-app-ep-np-svc service IP address assigned in your laptop to 
#   the service when it was deployed in the kind-1cp-2wn cluster
#      $ for i in {1..5}; do   echo "Loop ${i}: $(curl -s http://10.111.39.114:9090 | grep Hostname)"; done
