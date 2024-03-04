# pwsh
# Kubernetes Training

# delete kubernetes reverse proxy to the kube-apiserver
Stop-Job -Name kind-cluster-1cp-1wn-revpxy-8888
Remove-Job -Name kind-cluster-1cp-1wn-revpxy-8888
Get-Job
