#!/bin/bash pwsh
# Kubernetes Training

# download the kubernetes api specification from the kube-apiserver
Invoke-WebRequest -Uri http://127.0.0.1:8001/openapi/v2 `
      -UseBasicParsing -OutFile .\labs\mod-07\kind\api\kubernetes-api-swagger.json

