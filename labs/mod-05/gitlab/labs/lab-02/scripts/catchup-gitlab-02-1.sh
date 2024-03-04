#!/bin/bash

# catchup-gitlab-02-1.sh: gitlab runner installation and configuration
# steps: run this script in the gitlab-runr1 host as the pipe1 user
#        from your laptop or vm connect to the gitlab-runr1 host with:
#          cd gitlab-course
#          ssh -i keys/gitlabcourse -l pipe1 -p 33334 -o StrictHostKeyChecking=no localhost
#          . /labs/lab-02/scripts/catchup-gitlab-02-1.sh | tee -a ./catchup-gitlab-02-1.log

# load functions
. /labs/lib/func.sh

# check user and host
usr=pipe1 && check_user
hn=gitlab-runr1 && check_host

msg="Lab 02: Working with pipelines"; p_msg_header

msg="Managing a GitLab shared runner"; p_msg_section

msg="Installing the GitLab runner software"; p_msg_subsection

msg="1) Install the GitLab runner software and verify"; p_msg_step
curl -s -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" \
  | sudo bash
sudo dnf install gitlab-runner -y
sudo systemctl status gitlab-runner --no-pager
sudo ps -efH | grep "gitlab-runner run" | grep -v grep
sudo id gitlab-runner
sudo cat /etc/gitlab-runner/config.toml
# alternative option from gitlab-srv's provided installation instructions
# Download the binary for your system
# sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
# Give it permission to execute
# sudo chmod +x /usr/local/bin/gitlab-runner
# Create a GitLab Runner user
# sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
# Install and run as a service
# sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
# sudo gitlab-runner start

msg="2) Configure the CA SSL bundle "; p_msg_step
sudo mkdir -p /etc/gitlab-runner/certs
sudo cp /gitlab-share/ssl/certs/gitlab-srv.pem \
  /etc/gitlab-runner/certs/gitlab-srv.gitlabcourse.io.crt
sudo systemctl restart gitlab-runner 
sudo journalctl -u gitlab-runner --no-pager
sudo gitlab-runner status

# sudo wget -q -O /tmp/step-cli_0.23.1_amd64.rpm \
#   https://dl.step.sm/gh-release/cli/docs-ca-install/v0.23.1/step-cli_0.23.1_amd64.rpm
# sudo rpm -i /tmp/step-cli_0.23.1_amd64.rpm
# sudo step certificate install /gitlab-share/ssl/certs/root_ca.crt

msg="Register the GitLab runner"; p_msg_subsection

msg="Using a registration token"; p_msg_option

msg="1) Register the runner using a registration token"; p_msg_step
sudo gitlab-runner register --url https://gitlab-srv.gitlabcourse.io:4443/ \
  --config /etc/gitlab-runner/config.toml --registration-token S1mpl3-S3c4r3 \
  --name "gitlab-runr1" --executor shell --shell bash \
  --tag-list "runr1,runr1-test" --non-interactive
sudo cat /etc/gitlab-runner/config.toml
# curl --request POST "https://gitlab.example.com/api/v4/runners" \
#      --form "token=<registration_token>" --form "description=test-1-20150125-test" \
#      --form "tag_list=ruby,mysql,tag1,tag2"

# you can un-register the runner
# sudo gitlab-runner unregister --name gitlab-runr1
# you can unregister in the GitLab server but then you need to remove the 
# entry in /etc/gitlab-runner/config.toml for the runner manually, if not the
# runner will report errors about not registered or connecting to the gitlab server
# runrid=$(curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
#   --header "PRIVATE-TOKEN:GitLabAdmToken_4ALL" \
#   https://gitlab-srv.gitlabcourse.io:4443/api/v4/runners/all?tag_list=runr1 | jq '.[].id')
# curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
#   --request DELETE --header "PRIVATE-TOKEN:GitLabAdmToken_4ALL" \
#   "https://gitlab-srv.gitlabcourse.io:4443/api/v4/runners/$runrid"

# you can verify runners that are orphan and delete them
# sudo gitlab-runner verify —-delete -u https://gitlab-srv.gitlabcourse.io:4443/ --name gitlab-runr1
