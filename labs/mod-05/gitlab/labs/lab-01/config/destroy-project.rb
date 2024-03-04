prj = ARGV[0]
usn = ARGV[1]
user = User.find_by(username: usn)
puts "Deleting Project #{prj.upcase} from #{usn}'s personal namespace..."
project = Project.find_by(name: prj.upcase, namespace_id: user.namespace_id)
project.destroy! # removes the project, repostory and everything else (be careful)
puts('done')
exit
