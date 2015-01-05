class ThermometerMailer < ApplicationMailer
	# layout "alternative"
  default :from => "orelmfligelman@gmail.com"

  def thermo_confirmation (current_user)
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
		mail(
				:to => current_user.email,
				:subject => 'Welcome to My Awesome Site'
		)
  end
end
