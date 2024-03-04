#!/bin/bash

# catchup-gitlab-01-4.sh: gitlab installation and configuration
# steps: run this script in the gitlab-clnt2 host as the dev2 user
#        from your laptop or vm connect to the gitlab-clnt2 host with:
#          cd gitlab-course
#          ssh -i keys/gitlabcourse -l dev2 -p 33332 -o StrictHostKeyChecking=no localhost
#          . /labs/lab-01/scripts/catchup-gitlab-01-4.sh | tee -a ./catchup-gitlab-01-4.log

# load functions
. /labs/lib/func.sh

# check user and host
usr=dev2 && check_user
hn=gitlab-clnt2 && check_host

msg="Lab 01: Installation and configuration"; p_msg_header

msg="Prerequisites"; p_msg_section

msg="Using other utilities"; p_msg_subsection

msg="The glab utility"; p_msg_option

msg="1) Create the dev2 GitLab user using the adm-pa-tkn"; p_msg_step
curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
  --header "PRIVATE-TOKEN:GitLabAdmToken_4ALL" \
  --data "admin=false" --data "email=dev2@gitlab-srv.gitlabcourse.io" \
  --data "name='GitLab Developer 2'" --data "username=dev2" --data \
  "password=S1mpl3-S3c4r3" --data "skip_confirmation=true" \
  --data "note=Developer to create groups and projects from the gitlab-clnt2 host" \
  -X POST https://gitlab-srv.gitlabcourse.io:4443/api/v4/users/ | jq .

msg="2) Create the dev2-pa-tkn personal access token for the dev2 GitLab user"; p_msg_step
userid=$(curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
  https://gitlab-srv.gitlabcourse.io:4443/api/v4/users?username=dev2 | jq '.[].id')
expdate=$(date --date='1 year' '+%Y-%m-%d')
patkn=$(curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
  --header "PRIVATE-TOKEN:GitLabAdmToken_4ALL" --data "name=dev2-pa-tkn" \
  --data "expires_at=$expdate" --data "scopes[]=api" --data "user_id=$userid" \
  -X POST https://gitlab-srv.gitlabcourse.io:4443/api/v4/users/$userid/personal_access_tokens | jq '.token')
echo -e $(echo "PRIVATE-TOKEN:$patkn" | tr -d '"') | tr -d '"' > /gitlab-share/tokens/dev2.pa.tkn
bat /gitlab-share/tokens/dev2.pa.tkn

msg="3) Create the nodejs-grp as the dev2 user"; p_msg_step
patkn=$(cat /gitlab-share/tokens/dev2.pa.tkn)
curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem --header "$patkn" \
  --data "name=nodejs-grp" --data "path=nodejs-grp" --data "auto_devops_enabled=false" \
  --data "project_creation_level=developer" --data "request_access_enabled=false" \
  --data "visibility=private" --data "default_branch_protection=0" \
  -X POST https://gitlab-srv.gitlabcourse.io:4443/api/v4/groups | jq .

msg="4) Install the glab utility"; p_msg_step
sudo wget -q -O /tmp/glab_1.26.0_Linux_x86_64.deb \
  https://gitlab.com/gitlab-org/cli/-/releases/v1.26.0/downloads/glab_1.26.0_Linux_x86_64.deb 
sudo dpkg -i /tmp/glab_1.26.0_Linux_x86_64.deb
glab --version

msg="5) Install the Step CA CLI and trust in the Root CA in the system"; p_msg_step
sudo wget -q -O /tmp/step-cli_0.23.3_amd64.deb \
  https://dl.step.sm/gh-release/cli/gh-release-header/v0.23.3/step-cli_0.23.3_amd64.deb
sudo dpkg -i /tmp/step-cli_0.23.3_amd64.deb 
sudo step certificate install /gitlab-share/ssl/certs/root_ca.crt

msg="6) Configure glab settings for dev2"; p_msg_step
glab config set host gitlab-srv.gitlabcourse.io:4443 -g
glab config set api_protocol https -h gitlab-srv.gitlabcourse.io:4443 -g
glab config set token $(sed "s/PRIVATE-TOKEN://" /gitlab-share/tokens/dev2.pa.tkn) \
  -h gitlab-srv.gitlabcourse.io:4443 -g

msg="7) Create the sample-prj GitLab project in nodejs-grp group using glab"; p_msg_step
patkn=$(cat /gitlab-share/tokens/dev2.pa.tkn)
ns=$(curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
  --header "$patkn" \
  https://gitlab-srv.gitlabcourse.io:4443/api/v4/namespaces/nodejs-grp | jq '.id')
bat --pager=never /labs/lab-01/config/gitlab-nodejs-sample-project.json
jq --arg NS "$ns" '.namespace_id = $NS' /labs/lab-01/config/gitlab-nodejs-sample-project.json \
  > /tmp/nodejs-sample-prj.json
curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem --header "$patkn" \
  --header "Content-Type:application/json" --data @/tmp/nodejs-sample-prj.json \
  -X POST https://gitlab-srv.gitlabcourse.io:4443/api/v4/projects/ | jq .
# --- glab uses github.com/AlecAivazis/survey which doesn't support pipes for stdin
# glab repo create nodejs-grp/sample-prj --defaultBranch main \
#   --description "Sample NodeJS Project" --private --readme
glab repo list

msg="8) Create the SSH Key for authentication with Git and make a test"; p_msg_step
ssh-keygen -t ed25519 -q -N "" -C "dev2's GitLab SSH Key" -f $HOME/.ssh/ed25519-gitlab-srv-dev2
ls -la $HOME/.ssh/ed25519-gitlab-srv-dev2*
glab ssh-key add $HOME/.ssh/ed25519-gitlab-srv-dev2.pub -t "dev2-ed25519-sk"
glab ssh-key list
# another way is to use the rest api
# patkn=$(cat /gitlab-share/tokens/dev2.pa.tkn)
# pubsk=$(cat $HOME/.ssh/ed25519-gitlab-srv-dev2.pub)
# bat --pager=never /labs/lab-01/config/gitlab-dev2-ssh-key.json
# jq --arg PUBSK "$pubsk" '.key = $PUBSK' /labs/lab-01/config/gitlab-dev2-ssh-key.json \
#   > /tmp/dev2-ssh-key.json
# curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem --header "$patkn" \
#   --header "Content-Type:application/json" --data @/tmp/dev2-ssh-key.json \
#   -X POST https://gitlab-srv.gitlabcourse.io:4443/api/v4/user/keys/ | jq  
cp /labs/lab-01/config/dev2.ssh.config $HOME/.ssh/config
ssh-keyscan gitlab-srv.gitlabcourse.io >> $HOME/.ssh/known_hosts
ssh -T git@gitlab-srv.gitlabcourse.io

msg="9) Configure the dev2 Git settings, initialize Git local and pull remote GitLab repository"; p_msg_step
git config --global init.defaultBranch main
git config --global user.name dev2
git config --global user.email dev2@gitlab-srv.gitlabcourse.io
mkdir -p nodejs-sample-app
cd nodejs-sample-app
git init .
git remote add origin git@gitlab-srv.gitlabcourse.io:nodejs-grp/sample-prj.git
git pull origin main
git log HEAD origin/main
