usn = ARGV[0]
puts "Deleting Revoked Tokens for #{usn}"
user = User.find_by_username(usn)
all_tokens = user.personal_access_tokens.find_all
all_tokens.each do |tkn| 
    if tkn.revoked == true 
        tkn.destroy!
    end
end
exit
