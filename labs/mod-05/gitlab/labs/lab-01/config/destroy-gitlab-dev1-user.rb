name = 'GitLab Developer 1'
user = User.find_by(name: name)
puts "Deleting #{name} user: #{user.username}"
user.destroy! # user.delete! left the user as a ghost user (left orphans its groups, projects, controbutions) so no way to recreate it again
puts('done')
exit
