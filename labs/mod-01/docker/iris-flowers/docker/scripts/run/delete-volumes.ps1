# pwsh

# delete iris flowers docker volumes
# examples:
#   PS (iris-flowers)> .\docker\scripts\run\delete-volumes.ps1

# delete data and results volumes
docker volume rm --force iris-flowers-ml-data
docker volume rm --force iris-flowers-ml-results
docker volume ls --filter name=iris-flowers-*
 #>