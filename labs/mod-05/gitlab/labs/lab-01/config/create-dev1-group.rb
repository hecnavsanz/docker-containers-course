grp = 'dev1-grp'
desc = "dev1 team's group"
usn = 'dev1'
team = 'dev1-team'
puts "Creating Group #{grp} for #{usn} user..."
user = User.find_by(username: usn)
group = Group.create!(name: grp, path: team, auto_devops_enabled: false, 
    description: desc, default_branch_protection: 0, 
    project_creation_level: Gitlab::Access::DEVELOPER_MAINTAINER_PROJECT_ACCESS, 
    visibility: 'private')
group.save!
puts('done')
exit
