#!/bin/bash
# Kubernetes Training

# install kind binary
[ $(uname -m) = x86_64 ] && curl -s -Lo kind/bin/kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod u+x kind/bin/kind

# setup linux kernel configuration
sudo sysctl fs.inotify.max_user_watches=524288
sudo sysctl fs.inotify.max_user_instances=512
sudo sh -c 'echo "# fix too many open files (kind)\nfs.inotify.max_user_watches = 524288\nfs.inotify.max_user_instances = 512" >> /etc/sysctl.conf'

# display kind binary version
# kind/bin/kind version
