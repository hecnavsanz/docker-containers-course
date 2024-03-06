#!/usr/bin/env bash

# stop and remove docker containers, remove docker images and purge/prune cache/dangling images
# stop and remove docker containers
iris_flowers_cntrs=$(docker ps --all --filter name=iris-flowers* --quiet)
if [ -n "$iris_flowers_cntrs" ]
then
    printf "Stopping Iris Flowers docker containers:\n"
    for iris_flowers_cntr in $iris_flowers_cntrs;
    do
        docker stop -s SIGKILL "$iris_flowers_cntr"
        docker rm "$iris_flowers_cntr"
    done
fi

# remove docker volumes
iris_flowers_vols=$(docker volume ls --filter name=iris-flowers* --quiet)
if [ -n "$iris_flowers_vols" ]
then
    for iris_flowers_vol in $iris_flowers_vols;
    do
        printf "Deleting Iris Flowers docker volumes:\n"
        docker volume rm --force "$iris_flowers_vol"
    done
fi

# remove docker images
iris_flowers_imgs=$(docker images --all --filter reference=iris-flowers* --quiet)
if [ -n "$iris_flowers_imgs" ]
then
    for iris_flowers_img in $iris_flowers_imgs;
    do
        printf "Removing Iris Flowers docker images:\n"
        docker rmi "$iris_flowers_img"
    done
fi

# remove network bridges
iris_flowers_bgs=$(docker network ls --filter name=iris-flowers* --quiet)
if [ -n "$iris_flowers_bgs" ]
then
    printf "Removing Iris Flowers network bridges:\n"
    for iris_flowers_bg in $iris_flowers_bgs;
    do
        docker network rm "$iris_flowers_bg"
    done
fi

# delete dangling images
docker image prune --force
# delete builder cache
docker builder prune --force