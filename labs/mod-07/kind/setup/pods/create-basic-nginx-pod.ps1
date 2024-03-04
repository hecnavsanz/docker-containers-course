# pwsh
# Kubernetes Training

# create kubernetes pod using REST API (POST with YAML)
(Invoke-WebRequest -Uri http://localhost:8888/api/v1/namespaces/mod-07-ns/pods `
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
# the pod with the pod name must not exists, if not you get the error:
#   Error from server (AlreadyExists): error when creating "<dir>\<pod>.yaml": 
#     pods "<pod-name>" already exists.
# the pod can be updated when it was created using the REST API but you get the error:
#   Warning: resource pods/<pod-name> is missing the kubectl.kubernetes.io/last-applied-configuration 
#     annotation which is required by kubectl apply. kubectl apply should only be used on resources 
#     created declaratively by either kubectl create --save-config or kubectl apply. The missing 
#     annotation will be patched automatically.

# similar way but using kubectl
#   $cctx = (& .\kubectl\bin\kubectl.exe config current-context)
#   kubectl\bin\kubectl.exe create --context=$cctx --namespace=mod-07-ns \
#     --save-config=true \
#     -f labs\mod-07\kind\api\pods\basic-nginx-pod.yaml
