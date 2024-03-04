usn = 'dev1'
grp = 'python-grp'
desc = 'Python group'
puts "Creating group #{grp} with member: #{usn} (owner)"
user = User.find_by_username(usn)
group = Group.new(name: grp, path: grp, visibility: 'private',
    description: 'Python group', 
    project_creation_level: Gitlab::Access::DEVELOPER_MAINTAINER_PROJECT_ACCESS,
    request_access_enabled: false, default_branch_protection: 2,
    auto_devops_enabled: false)
group.save!
group.add_owner(user) # as a owner(50)
puts('done')
exit
# cannot access to group -> general or members : error HTTP 500
# can create projects but cannot access project -> members : error HTTP 500
