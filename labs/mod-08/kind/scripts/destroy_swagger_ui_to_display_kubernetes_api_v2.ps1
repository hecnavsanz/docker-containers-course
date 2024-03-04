# pwsh
# Kubernetes Training

# remove the Swagger UI container in Docker
docker rm -v -f $(docker ps -q --filter ancestor=swaggerapi/swagger-ui)
