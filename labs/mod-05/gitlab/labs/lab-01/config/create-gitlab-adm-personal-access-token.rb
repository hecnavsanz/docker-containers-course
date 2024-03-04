# example using set_token + save!
usn = 'adm'
tkn_name = 'adm-pa-tkn'
tkn_value = 'GitLabAdmToken_4ALL' # must be unique (in all GitLab) even with different tkn_name bcz each one has different level of privileges (api, developer ...)
puts "Creating GitLab Personal Access Token #{tkn_name} for #{usn}"
user = User.find_by_username(usn)
token = user.personal_access_tokens.create(scopes: ['api'], name: tkn_name)
token.set_token(tkn_value) # you can set one or left to GitLab to create a random one (this is the token_value attribute)
token.save!
puts "Token name: #{tkn_name}"
puts "Token value: #{tkn_value}"
puts('done')
exit
# another option to create a random token
# pat = PersonalAccessToken.create!(user_id: user.id, name: tkn_name, 
#    scopes: [:api])
# pat.token
