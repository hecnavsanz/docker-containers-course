#!/bin/bash

# catchup-gitlab-01-3.sh: gitlab installation and configuration
# time: 1-2 seconds in a Cloud VM w/ 2 vCPUs + 8GB RAM + 60GB SSD
# steps: run this script in the gitlab-srv host as the adm user
#        from your laptop or vm connect to the gitlab-srv host as adm with:
#          cd gitlab-course
#          ssh -i keys/gitlabcourse -l adm -p 33333 -o StrictHostKeyChecking=no localhost
#          . /labs/lab-01/scripts/catchup-gitlab-01-3.sh | tee -a ./catchup-gitlab-01-3.log

# load functions
. /labs/lib/func.sh

# check user and host
usr=adm && check_user
hn=gitlab-srv && check_host

msg="Lab 01: Installation and configuration"; p_msg_header

msg="Post-installation and configuration steps"; p_msg_section

msg="Using the database interfaces"; p_msg_subsection
sudo pstree

msg="The gitlab-psql utility"; p_msg_option
sudo ps -efH | grep postgres | grep -v grep
sudo netstat -anp --unix | grep postgres
sudo cat /opt/gitlab/etc/gitlab-psql-rc

msg="1) List the dev1 GitLab user's projects in the python-grp group"; p_msg_step
sudo gitlab-psql -c "select p.name project_name, g.name group_name, u.name user_desc \
  from projects p, namespaces g, users u where u.username = 'dev1' and g.name = 'python-grp' \
  and u.id = p.creator_id and g.id = p.namespace_id;"

msg="The gitlab-redis-cli utility"; p_msg_option
sudo ps -efH | grep redis | grep -v grep
sudo netstat -anp --unix | grep redis
sudo cat /opt/gitlab/etc/gitlab-redis-cli-rc

msg="1) List the Redis keyspace and number of keys"; p_msg_step
sudo sh -c "gitlab-redis-cli < /labs/lab-01/config/gitlab-redis.lua"

msg="2) Add the runner and developer users dev2, pipe1 and pipe2"; p_msg_step
sudo useradd --system --create-home --shell /bin/bash dev2
sudo sh -c "echo -n 'dev2:S1mpl3-S3c4r3' | chpasswd"
sudo useradd --system --create-home --shell /bin/bash pipe1
sudo sh -c "echo -n 'pipe1:S1mpl3-S3c4r3' | chpasswd"
sudo useradd --system --create-home --shell /bin/bash pipe2
sudo sh -c "echo -n 'pipe2:S1mpl3-S3c4r3' | chpasswd"
# check the uid and gid to match dockerfiles with gitlab-srv user/group ids too