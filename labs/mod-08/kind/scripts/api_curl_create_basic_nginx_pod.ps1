# pwsh
# Kubernetes Training

# create basic nginx pod using Invoke-WebRequest
(Invoke-WebRequest -Uri http://localhost:8888/api/v1/namespaces/mod-08-ns/pods `
    -UseBasicParsing `
    -Method 'POST' `
    -ContentType 'application/yaml' `
    -Body '---
           apiVersion: v1
           kind: Pod
           metadata:
                name: nginx
           spec:
                containers:
                - name: nginx
                  image: nginx:1.14.2
                  ports:
                  - containerPort: 80
    ').Content | Write-Output

# alternatively you can use the curl command too:
#
# curl http://localhost:8888/api/v1/namespaces/mod-02-ns/pods `
#      -X POST `
#      -H 'Content-Type: application/yaml' `
#      -d '---
#    apiVersion: v1
#    kind: Pod
#    metadata:
#      name: nginx
#    spec:
#      containers:
#      - name: nginx
#        image: nginx:1.14.2
#        ports:
#        - containerPort: 80
# '
