# pwsh
# Kubernetes Training

# install kubectl utility
$CDIR = $PWD.Path
Set-Location $CDIR\kubectl\bin

curl.exe -Lo .\kubectl.exe "https://dl.k8s.io/release/v1.29.0/bin/windows/amd64/kubectl.exe"

# display kubectl utility version
& $CDIR\kubectl\bin\kubectl.exe version --output=yaml

Set-Location $CDIR
