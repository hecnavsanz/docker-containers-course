# pwsh
# Kubernetes Training

# create the minikube cluster
.\minikube\bin\minikube.exe start --driver=docker --kubernetes-version=stable

# display the minikube profile
.\minikube\bin\minikube.exe profile list  

# display the minikube context (using minikube)
.\minikube\bin\minikube.exe kubectl -- config get-contexts

# display the contexts (using kubectl)
.\kubectl\bin\kubectl.exe config get-contexts

# display the minikube cluster information (using kubectl)
.\kubectl\bin\kubectl.exe cluster-info --context=minikube
