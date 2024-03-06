# pwsh

# run iris flowers ubuntu docker container
# arguments:
#   - Image Type: ubuntu, python, ml-venv, train-eval-models or predict-using-best-model
#   - Image Tag: image tag to specify when running the container
# examples:
#   PS (iris-flowers)> .\docker\scripts\run\run-container.ps1 "ubuntu" "20.04"
#   PS (iris-flowers)> .\docker\scripts\run\run-container.ps1 "python" "3.9"
#   PS (iris-flowers)> .\docker\scripts\run\run-container.ps1 "ml-venv" "1.1"

# image type and tag
$img_type=$Args[0]
$img_tag=$Args[1]
# run container
if ($img_type -eq "train-eval-models" -or $img_type -eq "predict-using-best-model") {
    docker run -d -it `
        --volume iris-flowers-ml-data:/home/imagina/data `
        --volume iris-flowers-ml-results:/home/imagina/results `
        --name iris-flowers-"$img_type"-"$img_tag"-cntr `
        iris-flowers-"$img_type":"$img_tag"
} else {
    docker run -d -it `
        --name iris-flowers-"$img_type"-"$img_tag"-cntr `
        iris-flowers-"$img_type":"$img_tag"
}
 #>