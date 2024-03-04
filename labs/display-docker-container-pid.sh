#!/bin/bash
# Kubernetes Training

cntr=$1
# display docker container operating system process identifier (pid)
docker inspect -f '{{.State.Pid}}' $cntr
