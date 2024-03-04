#!/bin/bash
# Kubernetes Training

# create basic nginx pod using curl
curl \
     -X POST \
     -H 'Content-Type: application/yaml' \
     -d '---
         apiVersion: v1
         kind: Pod
         metadata:
             name: nginx
         spec:
             containers:
             - name: nginx
               image: nginx:1.14.2
               ports:
               - containerPort: 80
' \
  http://localhost:8888/api/v1/namespaces/mod-02-ns/pods 
