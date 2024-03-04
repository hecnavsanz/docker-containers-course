#!/bin/bash
ml_ver=$1
py_ver=$2
docker build --build-arg ML_VERSION=$ml_ver --build-arg PYTHON_VERSION=$py_ver --tag ml-venv:$ml_ver --file Dockerfile.ml-venv .
