#!/usr/bin/env bash

# build iris flowers machine learning train and evaluate docker image
# arguments:
#   - Machine Learning Virtual Environment Version: ML python packages to use (1.0, 1.1, 2.0 ...)
#   - Iris Flowers Version: similar to an application version (1.0, 1.1, 2.0 ...) for the train and evaluate stages
# examples:
#   (iris-flowers)$ sh docker/scripts/build/build-ml-train-and-evaluate.sh "2.1" "1.0"
#   (iris-flowers)$ sh docker/scripts/build/build-ml-train-and-evaluate.sh "2.1" "1.1"
#   (iris-flowers)$ sh docker/scripts/build/build-ml-train-and-evaluate.sh "2.1" "2.0"

# ml virtual environment and iris flowers version image tags
ml_img_tag=$1
iris_flowers_version_tag=$2
docker build --build-arg ML_IMAGE_TAG="$ml_img_tag" \
             --tag iris-flowers-train-eval-models:"$iris_flowers_version_tag" \
             --label "io.imagina.image.train-eval-models.version=$iris_flowers_version_tag" \
             --progress plain \
             --file docker/dockerfiles/ml-train-and-evaluate-models.Dockerfile . 2>&1 \
                | tee docker/scripts/build/log/ml-train-and-evaluate-models.log
             # use --no-cache to rebuild even with existing cached built-layers
# display image
docker image ls --filter reference=iris-flowers-train-eval-models:"$iris_flowers_version_tag"
# display image layers (including parent layers)
docker image history -H --format table iris-flowers-train-eval-models:"$iris_flowers_version_tag"
