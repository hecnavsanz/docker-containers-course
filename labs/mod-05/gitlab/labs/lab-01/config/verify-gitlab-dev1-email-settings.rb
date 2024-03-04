# Send a test notification from GitLab
email = 'dev1@gitlab-srv.gitlabcourse.io'
subject = 'GitLab test'
body = 'test message'
puts "Sending email to: #{email}"
Notify.test_email(email, subject, body).deliver_now
exit
