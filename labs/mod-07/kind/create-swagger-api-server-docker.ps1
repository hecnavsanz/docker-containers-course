#!/bin/bash pwsh
# Kubernetes Training

# create the swagger api server container in docker to display the kubernetes api specification
docker run -d -it -p 8998:8080 `
        -e SWAGGER_JSON=/swagger.json --name swagger-api-server --mount `
        type=bind,source=.\labs\mod-02\kind\api\kubernetes-api-swagger.json,target=/swagger.json,readonly `
        swaggerapi/swagger-ui
