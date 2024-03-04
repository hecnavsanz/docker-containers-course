# pwsh
# Kubernetes Training

# download the Kubernetes API v2 to be used by the Swagger UI
Invoke-WebRequest -Uri http://127.0.0.1:8001/openapi/v2 `
      -UseBasicParsing -OutFile .\labs\mod-02\kind\api\k8s-swagger.json  
