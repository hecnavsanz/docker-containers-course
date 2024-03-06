#!/usr/bin/env bash

# stop and remove docker containers, remove docker images and purge/prune cache/dangling images
# stop and remove docker containers
$iris_flowers_cntrs = (docker ps --all --filter name=iris-flowers* --quiet)
if ($iris_flowers_cntrs -gt 0) {
    Write-Host ("Stopping Iris Flowers docker containers:") -ForegroundColor Yellow
    foreach ($iris_flowers_cntr in $iris_flowers_cntrs) {
        docker stop -s SIGKILL $iris_flowers_cntr
        docker rm $iris_flowers_cntr
    }
}

# remove docker volumes
$iris_flowers_vols = (docker volume ls --filter name=iris-flowers* --quiet)
if ($iris_flowers_vols -gt 0) {
    Write-Host ("Deleting Iris Flowers docker volumes:") -ForegroundColor Yellow
    foreach ($iris_flowers_vol in $iris_flowers_vols) {
        docker volume rm --force $iris_flowers_vol
    }
}

# remove docker images
$iris_flowers_imgs = (docker images --all --filter reference=iris-flowers* --quiet)
if ($iris_flowers_imgs -gt 0) {
    Write-Host ("Removing Iris Flowers docker images:") -ForegroundColor Yellow
    foreach ($iris_flowers_img in $iris_flowers_imgs) {
        docker rmi $iris_flowers_img
    }
}

# remove network bridges
$iris_flowers_bgs = (docker network ls --filter name=iris-flowers* --quiet)
if ($iris_flowers_bgs -gt 0) {
    Write-Host ("Removing Iris Flowers network bridges:") -ForegroundColor Yellow
    foreach ($iris_flowers_bg in $iris_flowers_bgs) {
        docker network rm $iris_flowers_bg
    }
}

# delete dangling images
docker image prune --force
# delete builder cache
docker builder prune --force
