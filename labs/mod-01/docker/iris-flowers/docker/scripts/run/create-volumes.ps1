# pwsh

# create iris flowers docker volumes
# examples:
#   PS (iris-flowers)> .\docker\scripts\run\create-volumes.ps1

# create data and results volumes
docker volume create iris-flowers-ml-data
docker volume create iris-flowers-ml-results
docker volume ls --filter name=iris-flowers-*
 #>