# pwsh
# Kubernetes Training

# delete the kind cluster
.\kind\bin\kind.exe delete cluster --name=test

# display the contexts (using kubectl)
.\kubectl\bin\kubectl.exe config get-contexts
