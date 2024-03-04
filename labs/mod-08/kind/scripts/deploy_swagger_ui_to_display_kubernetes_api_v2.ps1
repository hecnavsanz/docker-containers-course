# pwsh
# Kubernetes Training

# run the Swagger UI container in Docker to display the Kubernetes API v2
docker run -d -it -p 80:8080 `
  -e SWAGGER_JSON=/k8s-swagger.json --mount `
  type=bind,source=.\labs\mod-02\kind\api\k8s-swagger.json,target=/k8s-swagger.json,readonly `
  swaggerapi/swagger-ui

