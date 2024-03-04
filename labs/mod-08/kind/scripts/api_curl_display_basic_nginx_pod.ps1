# pwsh
# Kubernetes Training

# display basic nginx pod using Invoke-WebRequest
(Invoke-WebRequest -Uri http://localhost:8888/api/v1/namespaces/mod-02-ns/pods/nginx `
    -UseBasicParsing `
    -Method 'GET' `
    -ContentType 'application/json' `
    ).Content | Write-Output

# alternatively you can use the curl command too:
#
# curl http://localhost:8888/api/v1/namespaces/mod-02-ns/pods `
#       -X GET -H 'Content-Type: application/yaml'
