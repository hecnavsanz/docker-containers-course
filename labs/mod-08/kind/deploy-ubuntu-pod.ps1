# pwsh
# Kubernetes Training

# get current context
$cctx = (& .\kubectl\bin\kubectl.exe config current-context)

# create kubernetes ubuntu pod using kubectl
.\kubectl\bin\kubectl.exe create --context=$cctx `
  --save-config=true `
  -f .\labs\mod-08\kind\api\pods\ubuntu-pod.yaml

Start-Sleep -Seconds 10

.\kubectl\bin\kubectl.exe exec ubuntu-pod -c ubu-cntr -i -t `
    --context=$cctx --namespace=mod-08-ns `
    -- apt update -y
.\kubectl\bin\kubectl.exe exec ubuntu-pod -c ubu-cntr -i -t `
    --context=$cctx --namespace=mod-08-ns `
    -- apt install curl -y

.\kubectl\bin\kubectl.exe get pod ubuntu-pod --context=$cctx --namespace=mod-08-ns --output=wide
