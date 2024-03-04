# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# patch kubernetes pod using kubectl
.\kubectl\bin\kubectl.exe patch pod nginx --context=$cctx --namespace=mod-07-ns `
    -p '{"spec":{"containers":[{"name":"nginx","image":"nginx:1.25.2"}]}}'
# this patch command is similar to apply but providing the part of the pod definition (spec)
#   to change (update)
# when a pod container is updated (its image), the pod is terminated and restarted
#   but reusing the resources previously allocated (same UID, IP address, worker node ...)
# use describe command to see the events:
#   kubectl\bin\kubectl.exe describe pod nginx --context=kind-1cp-1wn --namespace=mod-07-ns
