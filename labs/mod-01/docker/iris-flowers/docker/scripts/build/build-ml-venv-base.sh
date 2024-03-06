#!/usr/bin/env bash

# build iris flowers machine learning virtual environment docker image
# arguments:
#   - Python Image Tag: python image tag to use (parent image)
#   - Machine Learning Virtual Environment Version: ML python packages to use (1.0, 1.1, 2.0 ...)
# examples:
#   (iris-flowers)$ sh docker/scripts/build/build-ml-venv-base.sh 3.8 1.0
#   (iris-flowers)$ sh docker/scripts/build/build-ml-venv-base.sh 3.9 1.1
#   (iris-flowers)$ sh docker/scripts/build/build-ml-venv-base.sh 3.10 2.0
#   (iris-flowers)$ sh docker/scripts/build/build-ml-venv-base.sh 3.11 2.1

# python image tag and ml packages version
py_img_tag=$1
ml_ver=$2
docker build --build-arg PYTHON_IMAGE_TAG="$py_img_tag" \
             --build-arg ML_VERSION="$ml_ver" \
             --tag iris-flowers-ml-venv:"$ml_ver" \
             --progress plain \
             --label "io.imagina.image.ml-venv.version=$ml_ver" \
             --file docker/dockerfiles/ml-venv-base.Dockerfile . 2>&1 \
                | tee docker/scripts/build/log/ml-venv-base.log
             # use --no-cache to rebuild even with existing cached built-layers
# display image
docker image ls --filter reference=iris-flowers-ml-venv:"$ml_ver"
# display image layers (including parent layers)
docker image history -H --format table iris-flowers-ml-venv:"$ml_ver"
