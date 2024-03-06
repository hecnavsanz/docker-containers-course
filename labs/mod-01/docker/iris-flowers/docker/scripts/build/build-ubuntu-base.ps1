# pwsh

# build iris flowers ubuntu docker image
# arguments:
#   - Ubuntu Release: Ubuntu OS version to use (focal = 20.04, jammy = 22.04)
# examples:
#   PS (iris-flowers)> .\docker\scripts\build\build-ubuntu-base.ps1 "20.04"
#   PS (iris-flowers)> .\docker\scripts\build\build-ubuntu-base.ps1 "22.04"

# ubuntu release
$ubu_rel = $Args[0]
# build image
docker build --build-arg UBUNTU_RELEASE="$ubu_rel" `
             --tag iris-flowers-ubuntu:"$ubu_rel" `
             --label "io.imagina.image.ubuntu.version=$ubu_rel" `
             --progress plain `
             --file docker\dockerfiles\ubuntu-base.Dockerfile .
             # use --no-cache to rebuild even with existing cached built-layers
# display image
docker image ls --filter reference=iris-flowers-ubuntu:"$ubu_rel"
# display image layers (including parent layers)
docker image history -H --format table iris-flowers-ubuntu:"$ubu_rel"
 #>