#!/bin/bash
# Kubernetes Training

# display basic nginx pod using curl
curl http://localhost:8888/api/v1/namespaces/mod-02-ns/pods/nginx \
      -X GET -H 'Content-Type: application/yaml'
