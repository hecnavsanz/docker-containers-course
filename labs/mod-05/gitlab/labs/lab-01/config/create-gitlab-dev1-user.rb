usn = 'dev1'
email = 'dev1@gitlab-srv.gitlabcourse.io'
name = 'GitLab Developer 1'
pwd = 'S1mpl3-S3c4r3'
puts "Creating #{name} account: #{usn}"
user = User.new(username: usn, email: email, name: name, 
        password: pwd, password_confirmation: pwd, 
        admin: false, can_create_group: true, 
        note: "Developer to create groups and projects from the gitlab-clnt1 host")
user.skip_confirmation! # also in addition to pass as params in User.new, attrs can be set later
user.save!
puts('done')
exit
