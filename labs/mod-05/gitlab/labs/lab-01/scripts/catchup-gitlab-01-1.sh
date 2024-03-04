#!/bin/bash

# catchup-gitlab-01-1.sh: gitlab installation and configuration
# time: 15-20 minutes in a Cloud VM w/ 2 vCPUs + 8GB RAM + 60GB SSD
# steps: run this script in the gitlab-srv host as the adm user
#        from your laptop or vm connect to the gitlab-srv host as adm with:
#          cd gitlab-course
#          ssh -i keys/gitlabcourse -l adm -p 33333 -o StrictHostKeyChecking=no localhost
#          . /labs/lab-01/scripts/catchup-gitlab-01-1.sh | tee -a ./catchup-gitlab-01-1.log

# load functions
. /labs/lib/func.sh

# check user and host
usr=adm && check_user
hn=gitlab-srv && check_host

msg="Lab 01: Installation and configuration"; p_msg_header

msg="Prerequisites"; p_msg_section

msg="Configure the SMTP server"; p_msg_subsection

msg="1) Postfix SMTP non-interactive installation"; p_msg_step 
sudo sh -c "debconf-set-selections /labs/lab-01/config/postfix.debconf"
sudo sh -c "DEBIAN_FRONTEND=noninteractive; \
  apt-get install postfix -y"

msg="2) Configure Postfix SMTP destination and subnet"; p_msg_step 
sudo cp /etc/postfix/main.cf /etc/postfix/main.cf.ORIG
sudo cp /labs/lab-01/config/postfix.main.cf /etc/postfix/main.cf
sudo systemctl reload postfix
sudo systemctl restart postfix
sudo postfix status

msg="3) Test email"; p_msg_step 
sudo apt-get install mailutils -y # in Red Hat-based systems: sudo dnf install s-nail -y 
echo "test email" | mail -s "test" adm@gitlab-srv.gitlabcourse.io
sleep 2
mailx -H

msg="Configure CA SSL server and certificates"; p_msg_subsection

msg="1) Download and install Step-CA Ubuntu packages"; p_msg_step
sudo wget -q -O /tmp/step-cli_0.23.3_amd64.deb \
  https://dl.step.sm/gh-release/cli/gh-release-header/v0.23.3/step-cli_0.23.3_amd64.deb
sudo dpkg -i /tmp/step-cli_0.23.3_amd64.deb 
sudo wget -q -O /tmp/step-ca_0.23.2_amd64.deb \
  https://dl.step.sm/gh-release/certificates/gh-release-header/v0.23.2/step-ca_0.23.2_amd64.deb
sudo dpkg -i /tmp/step-ca_0.23.2_amd64.deb

msg="2) Create step user and initialize Step-CA server"; p_msg_step
sudo mkdir -p /etc/step-ca
sudo sh -c 'echo "S1mpl3-S3c4r3" > /etc/step-ca/passwd.txt'
sudo sh -c 'echo "S1mpl3-S3c4r3" > /etc/step-ca/prov-passwd.txt'
sudo useradd --system --home /etc/step-ca --shell /bin/false step
sudo chown -R step:step /etc/step-ca
sudo -u step step ca init \
  --name=GitLabCourse --dns=gitlab-srv.gitlabcourse.io --dns=172.40.0.203 \
  --address=172.40.0.203:443 \
  --provisioner=gitlab-www@gitlabcourse.io --password-file=/etc/step-ca/passwd.txt \
  --provisioner-password-file=/etc/step-ca/prov-passwd.txt # echo your-root-fingerprint-above > /etc/step-ca/.step/root-fp just to keep it

msg="3) Set max. cert duration to 3600h"; p_msg_step
ca=$(sudo jq '.authority |= {
"claims": {
    "minTLSCertDuration": "5m",
    "maxTLSCertDuration": "3600h",
    "defaultTLSCertDuration": "3600h"
}
} + .' /etc/step-ca/.step/config/ca.json)
sudo -u step cp /etc/step-ca/.step/config/ca.json /etc/step-ca/.step/config/ca.json.ORIG
sudo -u step sh -c "echo '$ca' > /etc/step-ca/.step/config/ca.json"

msg="4) Create SystemD service and start the Step-CA server"; p_msg_step
sudo cp /labs/lab-01/config/step-ca.service /etc/systemd/system/step-ca.service
sudo systemctl daemon-reload
sudo systemctl enable --now step-ca
sudo systemctl status step-ca --no-pager

msg="5) Create SSL certs for GitLab server"; p_msg_step
sudo step certificate install /etc/step-ca/.step/certs/root_ca.crt
sudo mkdir -p /gitlab-dir/ssl
sudo chown step:step /gitlab-dir/ssl
sudo -u step sh -c "step ca certificate gitlab-srv.gitlabcourse.io \
  /gitlab-dir/ssl/gitlab-srv.crt /gitlab-dir/ssl/gitlab-srv.key \
  --san gitlab-srv.gitlabcourse.io --san 172.40.0.203 \
  --provisioner-password-file=/etc/step-ca/prov-passwd.txt"
sudo -u step sh -c "cp /etc/step-ca/.step/certs/root_ca.crt /gitlab-dir/ssl/"
sudo -u step sh -c "cp /etc/step-ca/prov-passwd.txt /gitlab-dir/ssl/prov-passwd.txt"
sudo ls -l /gitlab-dir/ssl

msg="GitLab server installation"; p_msg_section

msg="Installation"; p_msg_subsection

msg="1) Disable Apache HTTP server"; p_msg_step
sudo systemctl stop apache2
sudo systemctl disable apache2

msg="2) Povision gitlab.rb configuration file"; p_msg_step
sudo mkdir -p /etc/gitlab
sudo cp /labs/lab-01/config/gitlab.1.rb /etc/gitlab/gitlab.rb
bat --pager=never /etc/gitlab/gitlab.rb

msg="3) Check Ubuntu repository packages"; p_msg_step
sudo apt-get list curl gnupg apt-transport-https
sudo apt-get install apt-transport-https gnupg -y
sudo apt-get list curl gnupg apt-transport-https

msg="4) Trust in the GitLab Ubuntu repository GPG Key"; p_msg_step
sudo sh -c "curl -fsSL https://packages.gitlab.com/gitlab/gitlab-ce/gpgkey \
  | gpg --dearmor > /usr/share/keyrings/gitlab_gitlab-ce-archive-keyring.gpg"

msg="5) Add the GitLab Ubuntu repository"; p_msg_step
sudo cp /labs/lab-01/config/gitlab_gitlab-ce.list \
  /etc/apt/sources.list.d/gitlab_gitlab-ce.list
sudo bat /etc/apt/sources.list.d/gitlab_gitlab-ce.list

msg="6) Install the GitLab server and verify"; p_msg_step
sudo apt-get update -y
sudo apt-get install gitlab-ce -y
sudo systemctl status gitlab-runsvdir --no-pager
sudo sh -c 'ps -efH | egrep -i "nginx|gitlab-work|gitaly|sidekiq|postgres|redis|puma" | grep -v grep'
sudo cat /etc/passwd | grep git
sudo pstree

msg="7) Enable remote Git commands when using SSH protocol"; p_msg_step
sudo cp /etc/shadow /etc/shadow.ORIG
sudo sed -i "s/git:\!:/git:\*:/" /etc/shadow

msg="Post-installation and configuration steps"; p_msg_section

msg="Using the GitLab Rails comman-line utility"; p_msg_subsection

msg="1) Display Ruby on Rails environment"; p_msg_step
sudo localectl set-locale LANG=en_US.UTF-8
sudo -u git gitlab-rails about

msg="2) Display GitLab environment"; p_msg_step
sudo -u git gitlab-rails gitlab:env:info

msg="Interactive mode: gitlab-rails console"; p_msg_option

msg="1) Modify root's GitLab super administrator email"; p_msg_step
bat --pager=never /labs/lab-01/config/change-gitlab-root-username-email.rb
sudo -u git gitlab-rails runner /labs/lab-01/config/change-gitlab-root-username-email.rb
# --------------------
# alternative solution
# --------------------
# sudo -u git gitlab-rails console <<EOF
# user = User.find_by(name: 'Administrator')
# user.skip_reconfirmation!
# user.update!(email: 'adm@gitlab-srv.gitlabcourse.io')
# exit
# EOF
# maybe IRB bug using EOF in bash script but not when typed directly in terminal
# Errno::ENOTTY (Inappropriate ioctl for device) in GitLab 15.9.3 + Ruby 2.7.7p221

msg="2) Send a test email to adm (GitLab Administrator) (adm@gitlabcourse.io)"; p_msg_step
bat /labs/lab-01/config/verify-gitlab-adm-email-settings.rb
sudo -u git gitlab-rails runner /labs/lab-01/config/verify-gitlab-adm-email-settings.rb
mailx -H

msg="Non-interactive mode: gitlab-rails runner"; p_msg_option

msg="1) Create dev1 GitLab's user account (non-adm)"; p_msg_step
sudo useradd --system --create-home --shell /bin/bash dev1
sudo sh -c "echo -n 'dev1:S1mpl3-S3c4r3' | chpasswd"
sudo -u git gitlab-rails runner /labs/lab-01/config/create-gitlab-dev1-user.rb

msg="2) Disable the sign-up option (self-registration)"; p_msg_step
sudo -u git gitlab-rails runner /labs/lab-01/config/disable-gitlab-sign-up-option.rb

msg="Using the GitLab Control comman-line utility"; p_msg_subsection

msg="Managing GitLab components state"; p_msg_option

msg="1) Display the GitLab components status"; p_msg_step
sudo gitlab-ctl status

msg="2) Restart all the GitLab components"; p_msg_step
sudo gitlab-ctl restart
sudo gitlab-ctl stop postgresql
sudo gitlab-ctl start postgresql
sudo gitlab-ctl status postgresql

msg="Changing GitLab configuration settings"; p_msg_option

msg="1) Create the P1 project in adm's namespace"; p_msg_step
bat --pager=never /labs/lab-01/config/create-gitlab-project.rb
sudo gitlab-rails runner /labs/lab-01/config/create-gitlab-project.rb p1 adm

msg="2) Reconfigure default project settings"; p_msg_step
sudo cp /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.rb.INIT
sudo cp /labs/lab-01/config/gitlab.2.rb /etc/gitlab/gitlab.rb
sudo diff /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.rb.INIT
sudo gitlab-ctl reconfigure

msg="3) Create the P2 project in adm's namespace"; p_msg_step
sudo gitlab-rails runner /labs/lab-01/config/create-gitlab-project.rb p2 adm

msg="Using the GitLab Rake comman-line utility"; p_msg_subsection
msg="1) Verify the configuration of GitLab and its environment"; p_msg_step
sudo gitlab-rake gitlab:check

msg="Using the GitLab REST API"; p_msg_subsection

msg="Calling the GitLab REST API with a personal access token"; p_msg_option

msg="1) Install the HTTPIe client and create SSL CA bundle for adm user"; p_msg_step
curl -SsL https://packages.httpie.io/deb/KEY.gpg | sudo apt-key add -
sudo curl -SsL -o /etc/apt/sources.list.d/httpie.list https://packages.httpie.io/deb/httpie.list
sudo apt-get update -y
sudo apt-get install httpie -y
sudo mkdir -p /gitlab-share/ssl/certs
sudo cp /gitlab-dir/ssl/* /gitlab-share/ssl/certs
sudo sh -c "cat /gitlab-share/ssl/certs/gitlab-srv.crt /gitlab-share/ssl/certs/root_ca.crt > /gitlab-share/ssl/certs/gitlab-srv.pem"
sudo chown adm:adm /gitlab-share/ssl/certs/gitlab-srv.pem

msg="2) Create a personal access token for the adm GitLab administrator"; p_msg_step
bat --pager=never /labs/lab-01/config/create-gitlab-adm-personal-access-token.rb
sudo gitlab-rails runner /labs/lab-01/config/create-gitlab-adm-personal-access-token.rb

# you can list the root's (or any other user) personal access tokens using the REST API
# userid=$(http --print=b --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
#   GET https://gitlab-srv.gitlabcourse.io:4443/api/v4/users?username=root | jq '.[].id')
# http --print=b --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
#   GET "https://gitlab-srv.gitlabcourse.io:4443/api/v4/personal_access_tokens?user_id=$userid" \
#   "PRIVATE-TOKEN:GitLabRootToken_4ALL"

msg="3) Get the user id for dev1 GitLab user and set the expiration date"; p_msg_step
userid=$(http --print=b --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
  GET https://gitlab-srv.gitlabcourse.io:4443/api/v4/users?username=dev1 | jq '.[].id')
echo $userid
expdate=$(date --date='1 year' '+%Y-%m-%d')
echo $expdate

msg="4) Create the impersonation token for the dev1 user"; p_msg_step
imptkn=$(http --print=b --verify=/gitlab-share/ssl/certs/gitlab-srv.pem \
  POST "https://gitlab-srv.gitlabcourse.io:4443/api/v4/users/$userid/impersonation_tokens" \
  "PRIVATE-TOKEN:GitLabAdmToken_4ALL" "name=dev1-imp-tkn" "expires_at=$expdate" \
  "scopes[]=api" | jq '.token')
sudo mkdir -p /gitlab-share/tokens
sudo chown adm:adm /gitlab-share/tokens
echo -e $(echo "PRIVATE-TOKEN:$imptkn" | tr -d '"') | tr -d '"' > /gitlab-share/tokens/dev1.imp.tkn
bat /gitlab-share/tokens/dev1.imp.tkn
