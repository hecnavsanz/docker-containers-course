# pwsh

# build iris flowers machine learning virtual environment docker image
# arguments:
#   - Python Image Tag: python image tag to use (parent image)
#   - Machine Learning Virtual Environment Version: ML python packages to use (1.0, 1.1, 2.0 ...)
# examples:
#   PS (iris-flowers)> .\docker\scripts\build\build-ml-venv-base.ps1 "3.8" "1.0"
#   PS (iris-flowers)> .\docker\scripts\build\build-ml-venv-base.ps1 "3.8" "1.1"
#   PS (iris-flowers)> .\docker\scripts\build\build-ml-venv-base.ps1 "3.10" "2.0"
#   PS (iris-flowers)> .\docker\scripts\build\build-ml-venv-base.ps1 "3.11" "2.1"

# python image tag and ml packages version
$py_img_tag = $Args[0]
$ml_ver = $Args[1]
# build image
docker build --build-arg PYTHON_IMAGE_TAG="$py_img_tag" `
             --build-arg ML_VERSION="$ml_ver" `
             --tag iris-flowers-ml-venv:"$ml_ver" `
             --label "io.imagina.image.ml-venv.version=$ml_ver" `
             --file docker\dockerfiles\ml-venv-base.Dockerfile .
             # use --no-cache to rebuild even with existing cached built-layers
# display image
docker image ls --filter reference=iris-flowers-ml-venv:"$ml_ver"
# display image layers (including parent layers)
docker image history -H --format table iris-flowers-ml-venv:"$ml_ver"
 #>