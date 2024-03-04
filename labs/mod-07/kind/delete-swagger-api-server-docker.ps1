#!/bin/bash pwsh
# Kubernetes Training

# delete the swagger api server container in docker
docker rm -v -f $(docker ps -q --filter ancestor=swaggerapi/swagger-ui)  
docker image rm swaggerapi/swagger-ui
