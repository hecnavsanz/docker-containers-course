# pwsh
# Kubernetes Training

# create basic hello deployment YAML definition with 3 replicas
$string = [System.IO.File]::ReadAllText(".\labs\mod-02\kind\config\deployments\basic-hello-deployment.yaml").Replace("replicas: 2","replicas: 3")
[System.IO.File]::WriteAllText(".\labs\mod-02\kind\config\deployments\basic-hello-deployment-3-replicas.yaml", $string) 