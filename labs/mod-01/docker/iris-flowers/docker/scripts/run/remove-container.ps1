# pwsh

# remove iris flowers ubuntu docker container
# arguments:
#   - Image Type: ubuntu, python, ml-venv, train-eval-models or predict-using-best-model
#   - Image Tag: image tag to specify when running the container
# examples:
#   PS (iris-flowers)> .\docker\scripts\run\remove-container.ps1 "ubuntu" "20.04"
#   PS (iris-flowers)> .\docker\scripts\run\remove-container.ps1 "python" "3.9"
#   PS (iris-flowers)> .\docker\scripts\run\remove-container.ps1 "ml-venv" "1.1"

# image type and tag
$img_type=$Args[0]
$img_tag=$Args[1]
# run container
# stop container
docker stop -s SIGKILL iris-flowers-"$img_type"-"$img_tag"-cntr
# remove container
docker rm iris-flowers-"$img_type"-"$img_tag"-cntr
 #>