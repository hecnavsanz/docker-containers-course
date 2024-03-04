#!/bin/bash

# catchup-gitlab-02-2.sh: gitlab runner installation and configuration
# steps: run this script in the gitlab-runr2 host as the pipe2 user
#        from your laptop or vm connect to the gitlab-runr2 host with:
#          cd gitlab-course
#          ssh -i keys/gitlabcourse -l pipe2 -p 33335 -o StrictHostKeyChecking=no localhost
#          . /labs/lab-02/scripts/catchup-gitlab-02-2.sh | tee -a ./catchup-gitlab-02-2.log

# load functions
. /labs/lib/func.sh

# check user and host
usr=pipe2 && check_user
hn=gitlab-runr2 && check_host

msg="Lab 02: Working with pipelines"; p_msg_header

msg="Managing a GitLab project runner"; p_msg_section

msg="Installing the GitLab runner software"; p_msg_subsection

msg="1) Install the GitLab runner software and verify"; p_msg_step
curl -s -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" \
  | sudo bash
sudo apt-get install gitlab-runner -y
sudo systemctl status gitlab-runner --no-pager
sudo ps -efH | grep  "gitlab-runner run" | grep -v grep
sudo gitlab-runner status
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

msg="2) Install the Step CA CLI and trust in the Root CA in the system"; p_msg_step
sudo wget -q -O /tmp/step-cli_0.23.3_amd64.deb \
  https://dl.step.sm/gh-release/cli/gh-release-header/v0.23.3/step-cli_0.23.3_amd64.deb
sudo dpkg -i /tmp/step-cli_0.23.3_amd64.deb 
sudo step certificate install /gitlab-share/ssl/certs/root_ca.crt

msg="Register the GitLab project runner"; p_msg_subsection

msg="Using a project registration token"; p_msg_option

msg="1) Register the runner using the sample-prj project registration token"; p_msg_step
patkn=$(cat /gitlab-share/tokens/dev2.pa.tkn)
prjid=$(curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem --header "$patkn" \
  https://gitlab-srv.gitlabcourse.io:4443/api/v4/projects?path_with_namespace=nodejs-grp/sample-prj \
  | jq '.[] | select(.path_with_namespace=="nodejs-grp/sample-prj") | .id')
prjregtkn=$(curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
  --header "$patkn" \
  https://gitlab-srv.gitlabcourse.io:4443/api/v4/projects/$prjid \
  | jq '.runners_token' | tr -d '"')
prjtkn=$(curl -s --request POST "https://gitlab-srv.gitlabcourse.io:4443/api/v4/runners" \
     --form "token=$prjregtkn" --form "name=nodejs-sample-prj-gitlab-runr2" \
     --form "description=nodejs-sample-prj-gitlab-runr2" \
     --form "tag_list=nodejs-sample-prj,nodejs-sample-prj-runr2" \
     | jq '.token' | tr -d '"' )
sudo gitlab-runner register --url https://gitlab-srv.gitlabcourse.io:4443/ \
  --config /etc/gitlab-runner/config.toml --token "$prjtkn" \
  --executor shell --shell bash --tag-list "nodejs-sample-prj,nodejs-sample-prj-runr2" \
  --description "nodejs-sample-prj-gitlab-runr2" \
  --tls-ca-file "/gitlab-share/ssl/certs/root_ca.crt" \
  --tls-cert-file "/gitlab-share/ssl/certs/gitlab-srv.crt" \
  --tls-key-file "/gitlab-share/ssl/certs/gitlab-srv.key" \
  --name "nodejs-sample-prj-gitlab-runr2" --non-interactive
sudo cat /etc/gitlab-runner/config.toml

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
