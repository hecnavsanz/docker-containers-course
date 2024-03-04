# pwsh
# Kubernetes Training

# De-setup Swagger UI

# Stop and remove the Swagger API Server container (image)
docker rm -v -f $(docker ps -q --filter ancestor=swaggerapi/swagger-ui)
docker image rm swaggerapi/swagger-ui

# Remove the reverse proxy
Stop-Job -Name revpxyapi
Remove-Job -Name revpxyapi
