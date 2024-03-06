# pwsh

# build iris flowers machine learning train and evaluate docker image
# arguments:
#   - Machine Learning Virtual Environment Version: ML python packages to use (1.0, 1.1, 2.0 ...)
#   - Iris Flowers Version: similar to an application version (1.0, 1.1, 2.0 ...) for the train and evaluate stages
# examples:
#   PS (iris-flowers)> .\docker\scripts\build\build-ml-train-and-evaluate.ps1 "2.1" "1.0"
#   PS (iris-flowers)> .\docker\scripts\build\build-ml-train-and-evaluate.ps1 "2.1" "1.1"
#   PS (iris-flowers)> .\docker\scripts\build\build-ml-train-and-evaluate.ps1 "2.1" "2.0"

# ml virtual environment and iris flowers version image tags
$ml_img_tag = $Args[0]
$iris_flowers_version_tag = $Args[1]
# build image
docker build --build-arg ML_IMAGE_TAG="$ml_img_tag" `
             --tag iris-flowers-train-eval-models:"$iris_flowers_version_tag" `
             --label "io.imagina.image.train-eval-models.version=$iris_flowers_version_tag" `
             --file docker\dockerfiles\ml-train-and-evaluate-models.Dockerfile .
             # use --no-cache to rebuild even with existing cached built-layers
# display image
docker image ls --filter reference=iris-flowers-train-eval-models:"$iris_flowers_version_tag"
# display image layers (including parent layers)
docker image history -H --format table iris-flowers-train-eval-models:"$iris_flowers_version_tag"
 #>