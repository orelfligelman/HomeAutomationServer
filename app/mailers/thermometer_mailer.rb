class ThermometerMailer < ActionMailer::Base
	# layout "alternative"
  default :from => "orelmfligelman@gmail.com"

  def thermo_confirmation(thermometer)
		@thermometer = thermometer
		# puts "*" * 50
		# puts @user.inspect
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
		mail(
				:to => thermometer.email,
				:subject => "Welcome to My Awesome Site"
		)
  end
end
