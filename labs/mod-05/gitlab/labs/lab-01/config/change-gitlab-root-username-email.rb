# change Administrator primary email and notify
puts('Changing Administrator email...')
user = User.find_by(name: 'Administrator')
user.email # it shows admin@example.com
user.email = 'adm@gitlab-srv.gitlabcourse.io'
user.username = 'adm' # replace root by adm
user.skip_reconfirmation! # if not it must be verified
user.save!
# user.send_email_changed_notification # no sense to call here bcz it sends to admin@example.com
# old email (admin@example.com) becomes the Administrator's secondary email, so delete it
userid = user.id
email = Email.find_by(user_id: userid)
email.delete
puts('done')
exit
