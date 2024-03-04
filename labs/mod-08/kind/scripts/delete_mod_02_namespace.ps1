# pwsh
# Kubernetes Training

# delete kubernetes namespace using kubectl
# important: deleting a namespace will delete all the resources
#            associated to that namespace: pods, services ...
.\kubectl\bin\kubectl.exe delete namespace mod-02-ns `
  --context=kind-kind-cluster-1cp-1wn
