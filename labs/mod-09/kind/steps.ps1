### Contexts and Namespaces

# to display the contexts (clusters) already configured in the kubeconfig file
.\kubectl\bin\kubectl.exe config get-contexts

# to display the current context (cluster) in use
.\kubectl\bin\kubectl.exe config current-context 

# to display the contexts (cluster) details
.\kubectl\bin\kubectl.exe config view  

# to config a new context (cluster) in the kubeconfig file
.\kubectl\bin\kubectl.exe create namespace dev-ns
.\kubectl\bin\kubectl.exe config set-context dev --cluster=kind-1cp-2wn --server=https://0.0.0.0:63333 --namespace=dev-ns `
    --user=kind-1cp-2wn `
    --certificate-authority=LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJME1ERXlOREE0TURjeE1Wb1hEVE0wTURFeU1UQTRNRGN4TVZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBT29TCjBqREI3UlNvNHNzTTV0aG9IY0liTk1tS3lpbk1sZVUrSVp4dDNuSzJUYTVwWFJEaVlQNXg5QzVwTThaOFczS1cKdUVxN2JnSU4yRDhKU2lRZnUvUSsveFBuVzgvbmFwVDdtZ0tiS2l4eGRpNjNjbnZpdEpQUkFSQ2VUd1JJSXdmcApPT2cxd21PR3QvS09nMXJUUmNuazZLYlU3Wm00SFEvRzRVQlBicUxvc0tjUWxVbEhMY08xN0sva1FCTlJnV0pDCjhMYndxeVZPQVVLdmsrbUFtc0t2OFJLYnJTWVprOHZzZU5kV09wOWEwYTB2V0lNSXJweXNqRUFiWkQrS3Z3Q2oKR0w0VForcEg3SzhOT0pZa1dlU2x5RysrSHllZWs0by8veW1xWDA0T00wMFQzeWhPYWFyRG0wK1poOHdrenRFWQpJUmxZZEVWc1drOXVwd0ZqWFhVQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZQWnhMUDlKNDZpN3hoZ1FRaHRrd0Q0TU9lbDJNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBRzl1UitGUDhBTHAzVmFXYlRFTApUeG02a1gzYm5lNVZjVk9Ta3VMeTZvcGF3VzNralNaUC9QOTVmSzhGelNsRGxDYzNUZjJ4U0JERGx2MFdqd3VmCmhoTEFMWDdUMTc3dHByMXJTeWR2T1QzWjhvcTVla3JGT1dNekdLL0pFZEVKNHVnRThIT3pDV2RBNlhJU2NjeVgKV2xJZXV4T1FRYWEyaE04bXhLYktMMzVwR2I2TkhMMGRrenBWZFVGa0Y3eFBXcFdxK096VVJYWTRQUjdSR1pldgpxVVNSUzBCd25FaE95ZHVjcHpySzFiaXQxTGlzeFBoQUFtUDJCcGd0ZWVobHowTVdoaHpMQ3Fqb1VGaG5yUC80CnFWbGRFU0xoTjhockttcDhRY09UQ2pUWVNBeEFtN2pCdTYvN3dwQ1BQbzIxWGRIQlBCQkZITDNWVnZmWXVEZVAKZU9rPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg== `
    --client-certificate=LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURJVENDQWdtZ0F3SUJBZ0lJVlJSV1NjRTdXUGN3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TkRBeE1qUXdPREEzTVRGYUZ3MHlOVEF4TWpNd09EQTNNVE5hTURReApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1Sa3dGd1lEVlFRREV4QnJkV0psY201bGRHVnpMV0ZrCmJXbHVNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQXg1aUp0S2tqYVgvam1pQnUKaHQvMlZCeVN4Q2x2TElBclZXL0J6bnBWU1FqVEpRNVYxYmU3MXNnTDlOZVQxOU9iQ3pNd1BDQlRNVjZWSnR4VQpFdXowU21nMVc3MEthQUpZM1hHTWd0OHFkT1ZZR0JEMkd3YzIrRjdUK0hDKzVDSWt5ckRqTlhCcGlEaUNPcTA2CmIvVDhDbldUVmk1Y3ZiUGl2aVJoQ0YxMGRnUkI4QVAvRFZ0WGIrL3Yyd2tWVHNFdDhiQU1peVJERmtGZ091bGMKT0taR205UTFlUFVFbGFYeW56dzBSVGtRbFQyWDlvV3cvUlROOE5DOHhHRFlWTGQ4ZmVaOHlySGNnSEVqTHVpTAoyYTJieWN3djNvazd6QzNXRHB2YXZkNHRwSnZJaFp3N1U2K1JXRkhnRCtGRjlEN0ZQUUg3dWwrdTNWN1ZTTjNaCmZTNXVxd0lEQVFBQm8xWXdWREFPQmdOVkhROEJBZjhFQkFNQ0JhQXdFd1lEVlIwbEJBd3dDZ1lJS3dZQkJRVUgKQXdJd0RBWURWUjBUQVFIL0JBSXdBREFmQmdOVkhTTUVHREFXZ0JUMmNTei9TZU9vdThZWUVFSWJaTUErRERucApkakFOQmdrcWhraUc5dzBCQVFzRkFBT0NBUUVBaFRRR2xqbVNaNHo0M1BUWG5GdGlUN1p6STV2RmFuMENhNUg3CklYWnFmSkx3SkhRS3V1aS9YQTAwSjdRb1lWME1YWElpUGZjZFdkTXFUbEtjbGxlMzl0UXZRWHV5dkthYjZmblcKdm0xNzNYbHRoNFdydG5OR1JqcGNvZ3pKZjdnTG05RnFxTjZnQ3oyZWJpMWh6MXBjTC9MM01EcVkycnJQeGErNwpReDdBdXNsb0dmNXhnY0l1RStHczlOei9RSkNQekdKaVhhaTRMNTBqUFdycHk5MWxuN2VuWjFZcFpMOGUzQ21lCkhtNk93ZEhKNWRnZ255RmIzQUd4TTV5Qk9JNmZrYlcwL2lrRUN1ckIxbFJ6RTVicW44YWxWN0RpV25seWVKL1IKeDNpc0YySkJsSHNmSE10c2ZUY2lyY1NONVkvZUR2eVVjNG5kWE8rS0llSWpsWmwxK3c9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg== `
    --client-key=LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb3dJQkFBS0NBUUVBeDVpSnRLa2phWC9qbWlCdWh0LzJWQnlTeENsdkxJQXJWVy9Cem5wVlNRalRKUTVWCjFiZTcxc2dMOU5lVDE5T2JDek13UENCVE1WNlZKdHhVRXV6MFNtZzFXNzBLYUFKWTNYR01ndDhxZE9WWUdCRDIKR3djMitGN1QrSEMrNUNJa3lyRGpOWEJwaURpQ09xMDZiL1Q4Q25XVFZpNWN2YlBpdmlSaENGMTBkZ1JCOEFQLwpEVnRYYisvdjJ3a1ZUc0V0OGJBTWl5UkRGa0ZnT3VsY09LWkdtOVExZVBVRWxhWHluencwUlRrUWxUMlg5b1d3Ci9SVE44TkM4eEdEWVZMZDhmZVo4eXJIY2dIRWpMdWlMMmEyYnljd3Yzb2s3ekMzV0RwdmF2ZDR0cEp2SWhadzcKVTYrUldGSGdEK0ZGOUQ3RlBRSDd1bCt1M1Y3VlNOM1pmUzV1cXdJREFRQUJBb0lCQUhqaVBhU1pPOFZObTM5aApYUTk2M1NtY0ZKZVJzSzkzQU1mQjQ5TTE3Q2xMbXZXNmRPbjNXV0IvMEIzOTRxQzRuQkp3Y2lvNE9hcVE2aXliCkRLQlp1cXJGNm1zaFZ3Z2ZROHI2Vm10ODFhM3VxU2dLUGNPbzN2WVdHTE5ETlpuZHhBS3VseTFxWThBSTJYYkkKSzdoYTI3dEo4bTRqcmkrR256RWh2MUxkcHdkQ0FwbFlSZk9ZZHNDSTBsTzc2MWRpbHlXUS9ZZ3RWcTI5VjMzSwpWNkxMRmJuT2cvV0tWeG9Ub3J5Q011MXYxbjFkL2V1OFFJTUc3dkphMk9QQVNSMklKSldOQVdjTVErSldLaWJqCjNlZmR3eXNNK1pVZFc1MXA2TUlCS1pIa0hrbHJJOGQ1bC92MldkYURoVzVwc2g1SWF1bjF6MzJzMVIzTm9yMjMKeVo3OUUrRUNnWUVBMVY1Sk81eDQyNVhDd0U1anJlSHVaR3ltbUVTSzlJTUZrN1BCdkpQSTlFVzFZeXpFbmEwUwp6NEptc2k4QWVvd2JPQ1NyMTNNUlVvTUZMNS9HckJXUVMyRkh0NnBvOWgwOHhTWE5XVC9UOFZBNHUzRURVTmdOCk5WaWxHYWVCbERBV1JManJoV2RpOEV4RVk2Y1dHYlFTdnFremdpWE1rVjZGZkZZWEVPajV5bDBDZ1lFQTczbkwKc1Ivd1VwRm11Vnk1T1N3dmNJb0Q0elBUSVF2a3pFYUxDdHNaL3lmalBiSndxWXN4R05nRjRsNmxVKzZJWXdIegprY1djc0FZbWZ4ZDlLMmpQVHRqQ2JqWEtRdUo3WEsvdTN0V2d2QW5kN25Fa1NuNXpNZnZKMTI5aHlLZ2lyQ2hZCkVlazIxK3BNblptSWJhWi90WE41NWNpQldRV1Qza0VQSUk5cVhLY0NnWUJEeXhScnExaS9ORU5QeE5ocERDc3AKbjFnRGMydlBLcjRmNHZLQWoxZy9QTkxZTXdZNXJ4OFY3YkhobFl1S1pHL1ZrOWxCdUY3ZG42R0xNekgxeFZnMgppeTgxVFNEU2FoRy85alhiMEtydnRuU0FJZlZTdjRMYTIxS0I1ellGdG8yc3dqQ2JEM0ZoTm1wWVcyTnJRVXJmClozVmxPY3RZdVBhaXZkdlFWS1hoUlFLQmdGaUFUb0xiSnRtYzJyWE9TcldTV3NYZ2U2ZFAwOHIydGt1NEZsS2cKdm03SnN2VnVLS3kvd0JsS1hJSllNQWxnc2c3RS9kcjFpUDZVaDAyWXhLMXlRb3NGR0hYYWN6RmN1Zko3SW5BLwp5dk16UWsySWlyenRGbTEyZkJXZUdDa3IyZ1I5dEc2S0hiYVY1RktxRnYxTzl3dDc3YVM2QVBPQldEQmZJdFFKCnJHa3BBb0dCQUlRU3ppdGZTNzNucUpJSzNkamd3eXNpR205ZElaS2lVRFB4SHpZZmxoVzN3bDlYbi9EVmlwN1cKY1RFbUZ0VXZCYUM2UkhsNVZOWnA1ZGx6dUtBN1MyTWwzS1pYbUt2c0NRellJYVY4TzRSY2l1Tm5scVhsSjRYTQo3Zm9keXJQRjEvZVh0eTRNVVNJS0ZTU0ZFOXE2aEgySkRTemVDc2YwdGRZMkNrNDVJNENECi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg==

.\kubectl\bin\kubectl.exe config get-contexts
.\kubectl\bin\kubectl.exe config view

# to switch to a different context (cluster) in the kubeconfig file
.\kubectl\bin\kubectl.exe config use-context dev
.\kubectl\bin\kubectl.exe config view --raw
.\kubectl\bin\kubectl.exe get nodes

# to deploy a pod in the cluster using the default context (dev w/ dev-ns namespace)
.\kubectl\bin\kubectl.exe apply -f .\labs\mod-09\kind\api\pods\basic-nginx-1.25.2-pod.yaml
.\kubectl\bin\kubectl.exe get pods
.\kubectl\bin\kubectl.exe describe pod nginx-pod

# remove the namespace and the context
.\kubectl\bin\kubectl.exe delete namespace dev-ns
.\kubectl\bin\kubectl.exe config delete-context dev
.\kubectl\bin\kubectl.exe config get-contexts

# set the default context to the kind-1cp-2wn cluster
.\kubectl\bin\kubectl.exe config use-context kind-1cp-2wn
.\kubectl\bin\kubectl.exe config view

# see the pods in the default cluster
.\kubectl\bin\kubectl.exe get pods --output=wide

# to display kubernetes api server or other kubernetes components runtime configuration parameters
docker exec -it (docker ps -q --filter name=1cp-2wn-control-plane$) bash -c 'ps -w -w aux | grep kube-apiserver | grep -v grep' 
docker exec -it (docker ps -q --filter name=1cp-2wn-worker$) bash -c 'ps -w -w aux | grep kubelet | grep -v grep'

# to display the kubelet configuration inside a cluster node (control plane or worker)
docker exec -it (docker ps -q --filter name=1cp-2wn-control-plane$) bash -c 'echo $KUBECONFIG'
docker exec -it (docker ps -q --filter name=1cp-2wn-control-plane$) bash -c 'cat /etc/kubernetes/admin.conf' 
docker exec -it (docker ps -q --filter name=1cp-2wn-control-plane$) bash -c 'kubectl config view --raw'
# this file contents above are the same contents of the kubeconfig file in the host machine ($HOME\.kube\config)

### Access to the REST API (directly without the use of a kubectl proxy)
.\kubectl\bin\kubectl.exe config view -o jsonpath='{"Cluster name\tServer\n"}{range .clusters[*]}{.name}{"\t"}{.cluster.server}{"\n"}{end}'
$Env:clstname = (.\kubectl\bin\kubectl.exe config view -o jsonpath='{range .clusters[*]}{.name}{end}')
echo $Env:clstname
$Env:apisrv = (.\kubectl\bin\kubectl.exe config view -o jsonpath='{.clusters[?(@.name=="kind-1cp-2wn")].cluster.server}')
echo $Env:apisrv

# create a secret to hold a token for the default service account in the default namespace (every namespace has a default service account)
cat .\labs\mod-09\kind\api\secrets\default-token.yaml
.\kubectl\bin\kubectl.exe apply -f .\labs\mod-09\kind\api\secrets\default-token.yaml
.\kubectl\bin\kubectl.exe get secret default-token
# get the token from the secret
$Env:deftkn = (.\kubectl\bin\kubectl.exe get secret default-token -o jsonpath='{.data.token}')
echo $Env:deftkn
$Env:defsec = [Text.Encoding]::UTF8.GetString([convert]::FromBase64String("$Env:deftkn"))
echo $Env:defsec
# make a test call to the api server using the token (curl --help tls) (curl --help category)
curl -X GET https://localhost:63333/api --header "Authorization: Bearer $Env:defsec" --insecure

# $Env:kubeclntcert = (.\kubectl\bin\kubectl.exe config view --raw -o jsonpath='{range .users[*]}{.user.client-certificate-data}{end}')
# echo $Env:kubeclntcert
# Set-Content -Path '.\labs\mod-09\kind\kube.crt' -Value $Env:kubeclntcert
# $Env:kubeclntkey = (.\kubectl\bin\kubectl.exe config view --raw -o jsonpath='{range .users[*]}{.user.client-key-data}{end}')
# echo $Env:kubeclntkey
# Set-Content -Path '.\labs\mod-09\kind\kube.key' -Value $Env:kubeclntkey
# $Env:kubecacert = (.\kubectl\bin\kubectl.exe config view --raw -o jsonpath='{range .clusters[*]}{.cluster.certificate-authority-data}{end}')
# echo $Env:kubecacert
# Set-Content -Path '.\labs\mod-09\kind\ca.crt' -Value $Env:kubecacert

# curl -X GET https://localhost:63333/api --header "Authorization: Bearer $Env:defsec" `
#     --cacert .\labs\mod-09\kind\ca.crt `
#     --cert .\labs\mod-09\kind\kube.crt `
#     --cert-type PEM `
#     --key .\labs\mod-09\kind\kube.key

### Roles and RoleBindings (RBAC)

## using a user (no group) and externally signed certificates

# create a role to allow to list pods
cat .\labs\mod-09\kind\config\pod-reader-role.yaml
.\kubectl\bin\kubectl.exe apply -f .\labs\mod-09\kind\config\pod-reader-role.yaml

# create a role binding to bind the role to john user
cat .\labs\mod-09\kind\config\john-pod-reader-role-binding.yaml --context=kind-1cp-2wn
.\kubectl\bin\kubectl.exe apply -f .\labs\mod-09\kind\config\john-pod-reader-role-binding.yaml --context=kind-1cp-2wn

# https://slproweb.com/download/Win64OpenSSL-3_2_0.exe
# https://slproweb.com/download/Win64OpenSSL-3_2_0.msi
& "C:\Program Files\OpenSSL-Win64\bin\openssl.exe" genrsa -out .\labs\mod-09\kind\john.key 2048
& "C:\Program Files\OpenSSL-Win64\bin\openssl.exe" req -new -key .\labs\mod-09\kind\john.key -out .\labs\mod-09\kind\john.csr -subj "/CN=john"
docker cp 1cp-2wn-control-plane:/etc/kubernetes/pki/ca.crt .\labs\mod-09\kind\ca.crt  
docker cp 1cp-2wn-control-plane:/etc/kubernetes/pki/ca.key .\labs\mod-09\kind\ca.key
& "C:\Program Files\OpenSSL-Win64\bin\openssl.exe" x509 -req -in .\labs\mod-09\kind\john.csr -CA .\labs\mod-09\kind\ca.crt -CAkey .\labs\mod-09\kind\ca.key -set_serial 101 -extensions client -days 365 -outform PEM -out .\labs\mod-09\kind\john.crt

.\kubectl\bin\kubectl.exe config set-credentials john --client-key=.\labs\mod-09\kind\john.key --client-certificate=.\labs\mod-09\kind\john.crt --embed-certs

.\kubectl\bin\kubectl.exe config set-context john-cntx --cluster kind-1cp-2wn --user john 

.\kubectl\bin\kubectl.exe config get-contexts  

.\kubectl\bin\kubectl.exe get pods --context=john-cntx --output=wide # allowed

.\kubectl\bin\kubectl.exe get pods --context=john-cntx --namespace=kube-system --output=wide # forbidden

.\kubectl\bin\kubectl.exe apply -f .\labs\mod-09\kind\api\pods\echoserver-1.10-pod.yaml --context=john-cntx # forbidden

.\kubectl\bin\kubectl.exe auth can-i --list --context=john-cntx 

## using a group (user) and internally signed certificates
cat .\labs\mod-09\kind\config\pod-manager-role.yaml
.\kubectl\bin\kubectl.exe apply -f .\labs\mod-09\kind\config\pod-manager-role.yaml --context=kind-1cp-2wn

cat .\labs\mod-09\kind\config\kate-pod-manager-role-binding.yaml
.\kubectl\bin\kubectl.exe apply -f .\labs\mod-09\kind\config\kate-pod-manager-role-binding.yaml --context=kind-1cp-2wn

& "C:\Program Files\OpenSSL-Win64\bin\openssl.exe" genrsa -out .\labs\mod-09\kind\kate.key 2048 
& "C:\Program Files\OpenSSL-Win64\bin\openssl.exe" req -new -key .\labs\mod-09\kind\kate.key -out .\labs\mod-09\kind\kate.csr -subj "/CN=kate/O=kate-grp"
$Env:katecert = (Get-Content -Path .\labs\mod-09\kind\kate.csr -Raw) 
echo $Env:katecert
$Env:katereq = [convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes("$Env:katecert"))
echo $Env:katereq

notepad .\labs\mod-09\kind\config\kate-signing-certificate-request.yaml
.\kubectl\bin\kubectl.exe apply -f .\labs\mod-09\kind\config\kate-signing-certificate-request.yaml --context=kind-1cp-2wn
# docker cp 1cp-2wn-control-plane:/etc/kubernetes/pki/ca.crt .\labs\mod-09\kind\ca.crt  
# docker cp 1cp-2wn-control-plane:/etc/kubernetes/pki/ca.key .\labs\mod-09\kind\ca.key
# & "C:\Program Files\OpenSSL-Win64\bin\openssl.exe" x509 -req -in .\labs\mod-09\kind\kate.csr -CA .\labs\mod-09\kind\ca.crt -CAkey .\labs\mod-09\kind\ca.key -set_serial 101 -extensions client -days 365 -outform PEM -out .\labs\mod-09\kind\kate.crt
.\kubectl\bin\kubectl.exe certificate approve kate --context=kind-1cp-2wn
$Env:katecertcode = (.\kubectl\bin\kubectl.exe get csr kate -o jsonpath='{.status.certificate}' --context=kind-1cp-2wn)
echo $Env:katecertcode
$Env:katecert = [Text.Encoding]::UTF8.GetString([convert]::FromBase64String("$Env:katecertcode"))
echo $Env:katecert | Out-File -FilePath .\labs\mod-09\kind\kate.crt

.\kubectl\bin\kubectl.exe config set-credentials kate --client-key=.\labs\mod-09\kind\kate.key --client-certificate=.\labs\mod-09\kind\kate.crt --embed-certs

.\kubectl\bin\kubectl.exe config set-context kate-cntx --cluster kind-1cp-2wn --user kate 

.\kubectl\bin\kubectl.exe config get-contexts  

.\kubectl\bin\kubectl.exe get pods --context=kate-cntx --output=wide # allowed

.\kubectl\bin\kubectl.exe get pods --context=kate-cntx --namespace=kube-system --output=wide # forbidden

.\kubectl\bin\kubectl.exe apply -f .\labs\mod-09\kind\api\pods\echoserver-1.10-pod.yaml --context=kate-cntx # allowed

.\kubectl\bin\kubectl.exe auth can-i --list --context=kate-cntx 

.\kubectl\bin\kubectl.exe config delete-context john-cntx
.\kubectl\bin\kubectl.exe config delete-context kate-cntx

# .\kubectl\bin\kubectl.exe get pods --client-key=.\labs\mod-09\kind\john.key --client-certificate=.\labs\mod-09\kind\john.crt
