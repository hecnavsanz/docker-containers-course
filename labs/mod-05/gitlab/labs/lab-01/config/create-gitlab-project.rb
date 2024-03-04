prj = ARGV[0]
usn = ARGV[1]
user = User.find_by(username: usn)
puts "Creating GitLab Project #{prj.upcase} in #{usn}'s personal namespace..."
project = Project.new(creator_id: user.id, name: prj.upcase, path: prj, 
    namespace_id: user.namespace_id)
project.save!
project.create_repository # must create the project before and then initialize an empty repository
project.save!
puts "Default Project #{prj.upcase} settings:\n- wiki = #{project.wiki_enabled? ? 'enabled' : 'disabled'}\n- issues = #{project.issues_enabled? ? 'enabled' : 'disabled'}\n- snippets = #{project.snippets_enabled? ? 'enabled' : 'disabled'}"
puts('done')
exit
