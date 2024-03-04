#!/bin/bash

# catchup-gitlab-02-3.sh: gitlab runner installation and configuration
# steps: run this script in the gitlab-clnt2 host as the dev2 user
#        from your laptop or vm connect to the gitlab-clnt2 host with:
#          cd gitlab-course
#          ssh -i keys/gitlabcourse -l dev2 -p 33332 -o StrictHostKeyChecking=no localhost
#          . /labs/lab-02/scripts/catchup-gitlab-02-3.sh | tee -a ./catchup-gitlab-02-3.log

# load functions
. /labs/lib/func.sh

# check user and host
usr=dev2 && check_user
hn=gitlab-clnt2 && check_host

msg="Lab 02: Working with pipelines"; p_msg_header

msg="The test pipeline"; p_msg_section

msg="Git Recap"; p_msg_subsection

msg="1) Display the status of your nodejs-sample-app local Git repository"; p_msg_step
cd $HOME/nodejs-sample-app
git status -s
ls -l
git log HEAD
git ls-tree -r HEAD
sha=$(cat README.md | git hash-object README.md)
git cat-file -p $sha

msg="The .gitlab-ci.yml test pipeline file"; p_msg_subsection

msg="1) Provision the .gitlab-ci.yml in your nodejs-sample-app local repository"; p_msg_step
cp /labs/lab-02/config/.gitlab-ci.1.yml .gitlab-ci.yml
bat --pager=never .gitlab-ci.yml

msg="2) Check the changes in you local Git repository, commit them and then push them"; p_msg_step
git status -s
git add .
git status -s
git commit -m "test pipeline"
git push origin main

sleep 4
msg="3) Verify the test pipeline using glab"; p_msg_step
glab ci list --repo nodejs-grp/sample-prj
# glab ci view main --repo nodejs-grp/sample-prj
glab ci get --repo nodejs-grp/sample-prj
# glab ci status --branch main --live --repo nodejs-grp/sample-prj
# glab ci trace --branch main --repo nodejs-grp/sample-prj

msg="4) Verify the test pipeline using REST API with curl"; p_msg_step
patkn=$(cat /gitlab-share/tokens/dev2.pa.tkn)
prjid=$(curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
  --header "$patkn" \
  "https://gitlab-srv.gitlabcourse.io:4443/api/v4/projects" \
  | jq '.[] | select(.namespace.name=="nodejs-grp") | .id')
pipeid=$(curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
  --header "$patkn" \
  "https://gitlab-srv.gitlabcourse.io:4443/api/v4/projects/$prjid/pipelines" \
  | jq '.[] | .id')
# list the pipelines with status = failed
# curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
#   --header "$patkn" \
#   "https://gitlab-srv.gitlabcourse.io:4443/api/v4/projects/$prjid/pipelines" \
#   | jq '.[] | select(.status=="failed")'
curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
  --header "$patkn" \
  "https://gitlab-srv.gitlabcourse.io:4443/api/v4/projects/$prjid/pipelines/$pipeid" | jq

msg="5) Run the test pipeline again manually using REST API UI"; p_msg_step


# patkn=$(cat /gitlab-share/tokens/dev2.pa.tkn)
# prjid=$(curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
#   --header "$patkn" \
#   "https://gitlab-srv.gitlabcourse.io:4443/api/v4/projects" \
#   | jq '.[] | select(.namespace.name=="nodejs-grp") | .id')
# curl -s --cacert /gitlab-share/ssl/certs/gitlab-srv.pem \
#   --request POST --header "$patkn" \
#   "https://gitlab-srv.gitlabcourse.io:4443/api/v4/projects/$prjid/pipeline?ref=main"
# glab ci list --repo nodejs-grp/sample-prj
# glab ci get --branch main --pipeline-id 2 --repo nodejs-grp/sample-prj

# With `glab ci status --branch main --live --repo nodejs-grp/sample-prj`:
# Use arrow keys to navigate jobs and logs.
# 'Enter' to toggle a job's logs or trace.
# 'Ctrl+R', 'Ctrl+P' to run/retry/play a job -- Use Tab / Arrow keys to navigate modal and Enter to confirm.
# 'Ctrl+C' to cancel job -- (Quits CI/CD view if selected job isn't running or pending).
# 'Ctrl+Q' to Quit CI/CD View.
# 'Ctrl+Space' suspend application and view logs (similar to glab pipeline ci trace)
# Supports vi style bindings and arrow keys for navigating jobs and logs.

msg="5) Run the test pipeline again manually using REST API IDE (Insomnia)"; p_msg_step
glab ci list --repo nodejs-grp/sample-prj
glab ci get --branch main --pipeline-id 2 --repo nodejs-grp/sample-prj
