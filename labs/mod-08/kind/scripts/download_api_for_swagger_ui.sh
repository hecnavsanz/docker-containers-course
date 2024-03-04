#!/bin/bash
# Kubernetes Training

# download the Kubernetes API v2 to be used by the Swagger UI
curl http://127.0.0.1:8001/openapi/v2 \
      -X GET -H 'Content-Type: application/json' > \
      ./labs/mod-02/kind/api/k8s-swagger.json  
