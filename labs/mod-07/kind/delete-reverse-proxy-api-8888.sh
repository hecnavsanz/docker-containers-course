#!/bin/bash
# Kubernetes Training

# delete the kind-1cp-1wn Kubernetes cluster reverse proxy from localhost:8888
kill -9 $(cat /tmp/kind-1cp-1wn-revpxyapijob-8888.pid)
rm -Rf /tmp/kind-1cp-1wn-revpxyapijob-8888.*
