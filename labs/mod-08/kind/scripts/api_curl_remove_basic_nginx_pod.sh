#!/bin/bash
# Kubernetes Training

# remove basic nginx pod using curl
curl http://localhost:8888/api/v1/namespaces/mod-02-ns/pods/nginx -X DELETE
