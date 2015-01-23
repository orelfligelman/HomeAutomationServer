def perform (user_id)
	user = User.find(user_id)
	sleep(30)
	UserMailer.registration_confirmation(user).deliver
end