# pwsh

# build iris flowers python docker image
# arguments:
#   - OS Image Tag: operating system image tag to use (parent image)
#   - Python Version: python version to install (only 3.x supported: 3.8, 3.11 ...)
# examples:
#   PS (iris-flowers)> .\docker\scripts\build\build-python-base.ps1 "20.04" "3.9"
#   PS (iris-flowers)> .\docker\scripts\build\build-python-base.ps1 "22.04" "3.11"

# os image tag and python version
$os_img_tag = $Args[0]
$py_ver = $Args[1]
# check ubuntu image version compatibility with python version
$ubu_focal_pycompat = "3.8", "3.9"
$ubu_jammy_pycompat = "3.10", "3.11"
$ubu_ver = (docker image inspect iris-flowers-ubuntu:"$os_img_tag" `
                --format '{{ index .Config.Labels "io.imagina.image.ubuntu.version"}}')
if (($ubu_ver -eq "20.04" -and ("3.8", "3.9") -contains $py_ver) `
        -or ($ubu_ver -eq "22.04" -and ("3.10", "3.11") -contains $py_ver)) {
    # build image
    docker build --build-arg OS_IMAGE_TAG="$os_img_tag" `
                 --build-arg PYTHON_VERSION="$py_ver" `
                 --tag iris-flowers-python:"$py_ver" `
                 --label "io.imagina.image.python.version=$py_ver" `
                 --file docker\dockerfiles\python-base.Dockerfile .
                 # use --no-cache to rebuild even with existing cached built-layers
    # display image
    docker image ls --filter reference=iris-flowers-python:"$py_ver"
    # display image layers (including parent layers)
    docker image history -H --format table iris-flowers-python:"$py_ver"
} else {
    Write-Host ("Ubuntu 20.04 only supports Python 3.8 or 3.9`nUbuntu 22.04 only supports Python 3.10 or 3.11") -ForegroundColor Red
}
 #>