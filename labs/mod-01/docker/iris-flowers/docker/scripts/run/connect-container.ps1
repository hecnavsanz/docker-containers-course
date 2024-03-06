# pwsh

# connect to iris flowers docker container
# arguments:
#   - Image Type: ubuntu, python or ml-venv
#   - Image Tag: image tag to specify when connecting the container
# examples:
#   PS (iris-flowers)> .\docker\scripts\run\connect-container.ps1 "ubuntu" "20.04"
#   PS (iris-flowers)> .\docker\scripts\run\connect-container.ps1 "ml-venv" "1.0"
#   PS (iris-flowers)> .\docker\scripts\run\connect-container.ps1 "python" "3.9"

# image type and tag
$img_type=$Args[0]
$img_tag=$Args[1]
# connect to container
docker exec -it iris-flowers-"$img_type"-"$img_tag"-cntr bash
