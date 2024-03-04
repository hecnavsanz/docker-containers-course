# pwsh
# Kubernetes Training

# delete the port forward to the nginx pod
Stop-Job -Name nginx-pod-55000
Remove-Job -Name nginx-pod-55000
Get-Job
