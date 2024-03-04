# pwsh
# Kubernetes Training

# delete kubernetes pod using REST API (DELETE)
(Invoke-WebRequest -Uri http://localhost:8888/api/v1/namespaces/mod-07-ns/pods/nginx `
    -UseBasicParsing `
    -Method 'DELETE' `
    ).Content | Write-Output

# similar way but using kubectl
#   $cctx = (& .\kubectl\bin\kubectl.exe config current-context)
#   .\kubectl\bin\kubectl.exe delete pod nginx --context=$cctx --namespace=mod-07-ns
# when deleting a pod using a yaml file, the yaml file 
#   having just in its specification the pod name and the namespace is enough
# another way
#   $cctx = (& .\kubectl\bin\kubectl.exe config current-context)
#   .\kubectl\bin\kubectl.exe delete --context=$cctx -f labs\mod-07\kind\api\pods\nginx-pod.yaml
