# Disable self-registration option (sign-up)
is_enabled = ApplicationSetting.last.signup_enabled
puts "Is enabled? #{is_enabled}"
puts "Disabling sign-up option (self-registration)..."
ApplicationSetting.last.update(signup_enabled: false)
is_enabled = ApplicationSetting.last.signup_enabled
puts "Is enabled? #{is_enabled}"
puts('done')
exit
