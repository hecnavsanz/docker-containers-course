# gitlab-rails console
# Project.methods
# Project.methods.grep(/find/)
# project = Project.find_by_name("Monitoring")
# project.attributes

gitlab-rails console <<EOF
# Modify admin email
user = User.find_by(name: 'Administrator')
user.email = 'admin@core.io'
user.skip_reconfirmation!
user.save!
# create core user
user = User.new(username: 'core', email: 'core@core.io', name: 'core', password: '{{ lab_user_pwd }}', password_confirmation: '{{ lab_user_pwd }}', admin: false)
user.skip_confirmation!
user.save!
# create core project
project = Project.new(creator_id: user.id, name: 'core', path: 'core', auto_devops_enabled: true, namespace_id: user.namespace_id)
project.save!
Feature.enable(:pipeline_name)
EOF


cat > /tmp/test-config.template.toml << EOF
[[runners]]
[runners.docker]
[[runners.docker.services]]
name = "mysql:latest"
[[runners.docker.services]]
name = "redis:latest"
EOF

gitlab-runner register \
  --non-interactive \
  --url "https://gitlab.com" \
  --registration-token "$REGISTRATION_TOKEN" \
  --template-config /tmp/test-config.template.toml \
  --description "gitlab-ce-ruby-2.7" \
  --executor "docker" \
  --docker-image ruby:2.7
