# pwsh
# Kubernetes Training

# display kubernetes pods using REST API (GET)
(Invoke-WebRequest -Uri http://localhost:8888/api/v1/namespaces/mod-08-ns/pods `
    -UseBasicParsing `
    -Method 'GET' `
    -ContentType 'application/yaml').Content | Write-Output

# similar way but using kubectl
#   $cctx = (& .\kubectl\bin\kubectl.exe config current-context)
#   kubectl\bin\kubectl.exe get pods --context=$cctx --namespace=mod-08-ns --output=wide
