#!/bin/bash
# Kubernetes Training

# display kubernetes pods using REST API (GET)
curl -s -X GET -H "Content-Type: application/json" \
  http://localhost:8888/api/v1/namespaces/mod-07-ns/pods

# use jq to extract json data from the output
# curl -s -X GET -H "Content-Type: application/json" \
  # http://localhost:8888/api/v1/namespaces/mod-07-ns/pods | jq ".items[].metadata.name"

# similar way but using kubectl
#   cctx=$(kubectl/bin/kubectl config current-context)
  # kubectl/bin/kubectl get pods --context=$cctx --namespace=mod-07-ns --output=wide
