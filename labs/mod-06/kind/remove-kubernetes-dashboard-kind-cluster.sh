#!/bin/bash
# Kubernetes Training

# delete the Kubernetes cluster reverse proxy from localhost:8001
kill -9 $(cat /tmp/kind-2cp-2wn-revpxyapijob-8001.pid)
rm -Rf /tmp/kind-2cp-2wn-revpxyapijob-8001.*

# delete kubernetes-dashboard namespace with all the resources
kubectl/bin/kubectl delete namespace kubernetes-dashboard --context=kind-2cp-2wn
