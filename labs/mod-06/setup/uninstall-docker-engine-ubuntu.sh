#!/bin/bash
# Kubernetes Training

# uninstall docker engine

# remove existing docker engine packages
sudo apt-get update -y
sudo apt-get remove docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo apt-get update -y
