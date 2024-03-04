# it's automatically revoked and then removed permanently
usn = 'root'
tkn_name = 'root-tkn'
puts "Deleting Personal Access Token #{tkn_name} for #{usn}"
user = User.find_by_username(usn)
token = user.personal_access_tokens.find_by(name: tkn_name)
token.destroy!
puts('done')
exit
