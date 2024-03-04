#!/bin/bash
ml_ver=$1
app_ver=$2
docker build --build-arg ML_VERSION=$ml_ver --tag app:$app_ver --file Dockerfile.app .
