# pwsh
# Kubernetes Training

# Setup Swagger UI

# Create the reverse proxy
$revpxy = Start-Job -Name revpxyapi -ScriptBlock { .\kubectl\bin\kubectl.exe proxy --context=kind-kind-cluster-1cp-1wn --port=8001 }  
Receive-Job $revpxy

# Download the REST API
curl localhost:8001/openapi/v2 > .\labs\mod-02\kind\api\k8s-swagger.json  

# Run the Swagger API Server container 
docker run -d -it -p 80:8080 -e SWAGGER_JSON=/k8s-swagger.json --mount type=bind,source=.\labs\mod-02\kind\api\k8s-swagger.json,target=/k8s-swagger.json,readonly swaggerapi/swagger-ui

# Now access to the Swagger UI http://localhost
