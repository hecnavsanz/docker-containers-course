#!/bin/bash
# Kubernetes Training

# create kubernetes port forward
kill -9 $(cat /tmp/basic-nginx-pod-portforwardjob-55000.pid)
rm -Rf /tmp/basic-nginx-pod-portforwardjob-55000.*
