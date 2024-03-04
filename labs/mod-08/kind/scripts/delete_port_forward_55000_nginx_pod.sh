#!/bin/bash
# Kubernetes Training

# delete the port forward to the nginx pod
pkill -F /tmp/nginx-portfwd-55000.pid
rm -Rf /tmp/nginx-portfwd-55000.pid
