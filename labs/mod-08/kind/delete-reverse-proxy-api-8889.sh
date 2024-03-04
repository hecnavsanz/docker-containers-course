#!/bin/bash
# Kubernetes Training

# delete the Kubernetes cluster reverse proxy from localhost:8889
kill -9 $(cat /tmp/kind-1cp-2wn-revpxyapijob-8889.pid)
rm -Rf /tmp/kind-1cp-2wn-revpxyapijob-8889.*
