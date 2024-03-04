# delete a group
grp = 'python-grp'
puts "Deleting group #{grp}"
group = Group.find_by(name: 'python-grp')
group.destroy! # be careful bcz you will remove all the projects
exit
