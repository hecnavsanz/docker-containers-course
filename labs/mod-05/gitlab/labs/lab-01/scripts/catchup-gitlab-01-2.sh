#!/bin/bash

# catchup-gitlab-01-2.sh: gitlab installation and configuration
# time: 5-10 seconds in a Cloud VM w/ 2 vCPUs + 8GB RAM + 60GB SSD
# steps: run this script in the gitlab-clnt1 host as the dev1 user
#        from your laptop or vm connect to the gitlab-clnt1 host as dev1:
#          cd gitlab-course
#          ssh -i keys/gitlabcourse -l dev1 -p 33331 -o StrictHostKeyChecking=no localhost
#          . /labs/lab-01/scripts/catchup-gitlab-01-2.sh | tee -a ./catchup-gitlab-01-2.log

# load functions
. /labs/lib/func.sh

# check user and host
usr=dev1 && check_user
hn=gitlab-clnt1 && check_host

msg="Lab 01: Installation and configuration"; p_msg_header

msg="Post-installation and configuration steps"; p_msg_section

msg="Using the GitLab REST API"; p_msg_subsection

msg="Calling the GitLab REST API with an impersonation token"; p_msg_option

msg="1) Verify the impersonation token for the dev1 user was created"; p_msg_step
# you can list the dev1's (or any other user) impersonation tokens using the REST API
# this will display the impersonation: true key in the output
userid=$(curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
  https://gitlab-srv.gitlabcourse.io:4443/api/v4/users?username=dev1 | jq '.[].id')
curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
  --header "PRIVATE-TOKEN:GitLabAdmToken_4ALL" \
  https://gitlab-srv.gitlabcourse.io:4443/api/v4/users/$userid/impersonation_tokens | jq .
# -or- (impersonation tokens are seen as personal access tokens too for a gitlab user)
# this will not display the impersonation: true key in the output
# http --print=b --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
#   GET "https://gitlab-srv.gitlabcourse.io:4443/api/v4/personal_access_tokens?user_id=$userid" \
#   "PRIVATE-TOKEN:GitLabAdmToken_4ALL"

# you can revoke the dev1-imp-tkn impersonation token for the dev1 user using the REST API
# userid=$(http --print=b --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
#   GET https://gitlab-srv.gitlabcourse.io:4443/api/v4/users?username=dev1 | jq '.[].id')
# tokenid=$(http --print=b --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
#   GET "https://gitlab-srv.gitlabcourse.io:4443/api/v4/users/$userid/impersonation_tokens/" \
#   "PRIVATE-TOKEN:GitLabAdmToken_4ALL" | jq '.[] | select(.name=="dev1-imp-tkn") | .id')
# http --print=b --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
#   DELETE "https://gitlab-srv.gitlabcourse.io:4443/api/v4/users/$userid/impersonation_tokens/$tokenid" \
#   "PRIVATE-TOKEN:GitLabAdmToken_4ALL" 

msg="2) Create the python-grp group with the sample-prj project with dev1 as the owner"; p_msg_step
imptkn=$(cat /gitlab-share/tokens/dev1.imp.tkn)
curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
  --header "$imptkn" \
  --data "name=python-grp" --data "path=python-grp" --data "auto_devops_enabled=false" \
  --data "project_creation_level=developer" --data "request_access_enabled=false" \
  --data "visibility=private" --data "default_branch_protection=0" \
  -X POST https://gitlab-srv.gitlabcourse.io:4443/api/v4/groups | jq .
ns=$(curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
  --header "$imptkn" \
  https://gitlab-srv.gitlabcourse.io:4443/api/v4/namespaces/python-grp | jq '.id')
bat --pager=never /labs/lab-01/config/gitlab-python-sample-project.json
jq --arg NS "$ns" '.namespace_id = $NS' /labs/lab-01/config/gitlab-python-sample-project.json \
  > /tmp/python-sample-prj.json
curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem --header "$imptkn" \
  --header "Content-Type:application/json" --data  @/tmp/python-sample-prj.json \
  -X POST https://gitlab-srv.gitlabcourse.io:4443/api/v4/projects/ | jq .
# using httpie:
# http --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
#   POST https://gitlab-srv.gitlabcourse.io:4443/api/v4/groups \
#   $(echo "PRIVATE-TOKEN:$imptkn" | tr -d '"') "name=python-grp" "path=python-grp" \
#   "auto_devops_enabled=false" "project_creation_level=developer" \
#   "request_access_enabled=false" "visibility=private" "default_branch_protection=0"
# ns=$(http --print=b --verify=/gitlab-share/ssl/certs/gitlab-srv.pem GET \
#   "https://gitlab-srv.gitlabcourse.io:4443/api/v4/namespaces/python-grp" \
#   $(echo "PRIVATE-TOKEN:$imptkn" | tr -d '"') | jq '.id')
# echo -n $(jq --arg NS "$ns" '.namespace_id = $NS' /labs/lab-01/config/gitlab-python-sample-project.json) \
#   | http --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
#   POST https://gitlab-srv.gitlabcourse.io:4443/api/v4/projects/ \
#   $(echo "PRIVATE-TOKEN:$imptkn" | tr -d '"') "Content-Type:application/json"

# you can display the dev1's groups
# http --print=b --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
#   GET "https://gitlab-srv.gitlabcourse.io:4443/api/v4/groups" $imptkn
# you can delete the python-grp group for dev1
# grp=$(http --print=b --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
#   GET "https://gitlab-srv.gitlabcourse.io:4443/api/v4/groups?name=python-grp&owned=true" \
#   $(echo "PRIVATE-TOKEN:$imptkn" | tr -d '"') | jq '.[] | select(.name=="python-grp") | .id')
# http --print=b --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
#   DELETE "https://gitlab-srv.gitlabcourse.io:4443/api/v4/groups/$grp" \
#   $(echo "PRIVATE-TOKEN:$imptkn" | tr -d '"')

msg="3) Install the Step CA CLI and trust in the Root CA in the system"; p_msg_step
sudo wget -q -O /tmp/step-cli_0.23.1_amd64.rpm \
  https://dl.step.sm/gh-release/cli/docs-ca-install/v0.23.1/step-cli_0.23.1_amd64.rpm
sudo rpm -i /tmp/step-cli_0.23.1_amd64.rpm
sudo step certificate install /gitlab-share/ssl/certs/root_ca.crt

msg="4) Create the python-sample-app Git repository and synchronize with the python-grp/sample-app GitLab repository"; p_msg_step
imptkn=$(cat /gitlab-share/tokens/dev1.imp.tkn)
git config --global init.defaultBranch main
git config --global user.name dev1
git config --global user.email dev1@gitlab-srv.gitlabcourse.io
mkdir -p python-sample-app
cd python-sample-app
git init .
imptkn=$(sed "s/PRIVATE-TOKEN://" /gitlab-share/tokens/dev1.imp.tkn)
git remote add origin https://gitlab-ci-token:$imptkn@gitlab-srv.gitlabcourse.io:4443/python-grp/sample-prj.git
git pull origin main
git log HEAD
ls -l
git ls-tree -r HEAD
