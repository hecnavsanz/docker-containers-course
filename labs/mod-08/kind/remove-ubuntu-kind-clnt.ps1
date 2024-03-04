# pwsh
# Kubernetes Training

# remove ubuntu client docker container and image
docker stop $(docker ps -q --filter name=ubuntu-kind-clnt)
docker rm ubuntu-kind-clnt
docker rmi ubuntu:focal
