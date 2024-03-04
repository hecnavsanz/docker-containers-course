# change Administrator primary email and notify
usn = "dev1"
puts "Display personal namespace for #{usn}..."
user = User.find_by(username: usn)
ns_name = user.namespace.name
ns_path = user.namespace.path
puts "#{ns_name}'s namespace at:"
puts "- https://gitlab-srv.gitlabcourse.io:4443/#{ns_path} (inside)"
puts "- https://localhost:14443/#{ns_path} (from laptop/vm)"
exit
