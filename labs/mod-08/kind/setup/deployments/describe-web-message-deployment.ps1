# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# describe kubernetes deployment using kubectl
.\kubectl\bin\kubectl.exe describe deployment web-message-dp `
    --context=$cctx --namespace=mod-08-ns
