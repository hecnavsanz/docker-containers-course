# pwsh
# Kubernetes Training

# delete the Kubernetes cluster reverse proxy from localhost:8001
Stop-Job -Name kind-revpxyapi-8001
Remove-Job -Name kind-revpxyapi-8001
Get-Job -Verbose

# delete kubernetes-dashboard namespace with all the resources
kubectl\bin\kubectl.exe delete namespace kubernetes-dashboard --context=kind-2cp-2wn
