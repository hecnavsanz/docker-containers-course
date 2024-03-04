#!/bin/bash
# Kubernetes Training

# display docker containers
docker ps --filter name=2cp-2wn \
    --format 'table {{ .ID}} {{ .Names}} {{ .Networks}} {{ .Ports}}'
