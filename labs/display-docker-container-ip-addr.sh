#!/bin/bash
# Kubernetes Training

# parameter container name
cntr=$1
# display docker container operating system process identifier (pid)
docker inspect -f '{{.State.Pid}}' $cntr
