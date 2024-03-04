# pwsh
# Kubernetes Training

# Transfer the PKI Client Certs from the Kind Cluster "b" to the laptop
docker cp kind-cluster-1cp-1wn-control-plane:/etc/kubernetes/pki/ca.crt .\labs\mod-02\kind\pki\ca.crt   
docker cp kind-cluster-1cp-1wn-control-plane:/etc/kubernetes/pki/apiserver.crt .\labs\mod-02\kind\pki\client.crt
docker cp kind-cluster-1cp-1wn-control-plane:/etc/kubernetes/pki/apiserver.key .\labs\mod-02\kind\pki\client.key
