usn = ARGV[0]
puts "Revoking Tokens for #{usn}"
user = User.find_by_username(usn)
all_tokens = user.personal_access_tokens.find_all
all_tokens.each do |tkn| 
    tkn.revoke!
end
exit
