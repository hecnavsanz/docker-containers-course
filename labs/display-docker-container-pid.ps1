# pwsh
# Kubernetes Training

$cntr = $Args[0]
# display docker container ip address (in the network bridge)
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $cntr
