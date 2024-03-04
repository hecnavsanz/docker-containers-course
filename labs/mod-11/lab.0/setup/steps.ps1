# pwsh

apt update -y

apt install -y curl openssh-server ca-certificates tzdata perl

curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

EXTERNAL_URL="https://gitlabsrv.core.io" apt install gitlab-ce -y