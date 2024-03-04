# SMTP
ActionMailer::Base.delivery_method
# Use local Postfix SMTP server w/o authentication and TLS
ActionMailer::Base.smtp_settings
# Send a test notification from GitLab
# Send a test notification from GitLab
email = 'adm@gitlab-srv.gitlabcourse.io'
subject = 'GitLab test'
body = 'test message'
puts "Sending email to: #{email}"
Notify.test_email(email, subject, body).deliver_now
exit
