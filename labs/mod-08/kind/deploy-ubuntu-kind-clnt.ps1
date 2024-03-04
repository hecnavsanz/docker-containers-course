# pwsh
# Kubernetes Training

# deploy ubuntu client docker container connected to the kind network
#   this container can communicate with the control planes and worker nodes
#     in addition to nodeport services and some other stuff deployed in Kind kubernetes cluster
#   it has curl cmd-line to display applications web requests deployed in pods in the Kind 
#     kubernetes cluster and accessible through kubernetes nodeport services for example
docker pull ubuntu:focal
docker run -itd --network=kind --hostname=ubuntu-kind-clnt --name=ubuntu-kind-clnt ubuntu:focal
docker exec -it $(docker ps -q --filter name=ubuntu-kind-clnt) apt update -y
docker exec -it $(docker ps -q --filter name=ubuntu-kind-clnt) apt install curl -y
