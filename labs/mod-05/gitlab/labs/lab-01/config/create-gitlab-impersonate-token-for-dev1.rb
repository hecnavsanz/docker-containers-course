# example using attributes: impersonation
# - impersonation to specify an impersonation token, not a personal access token
for_usn = 'dev1'
tkn_name = 'dev1-tkn'
puts "Creating Impersonation Token #{tkn_name} for #{for_usn}"
for_user = User.find_by_username(for_usn)
token = for_user.personal_access_tokens.create(scopes: ['api'], name: tkn_name, 
    impersonation: true)
puts "Token name: #{token.name}"
puts "Token value: #{token.token}"
puts('done')
exit
# another option
# pat = PersonalAccessToken.create!(user_id: for_user.id, name: tkn_name, 
#    scopes: [:api], impersonation: true)
# pat.token