class ThermometerMailer < ActionMailer::Base
	# layout "alternative"
  default :from => "orelmfligelman@gmail.com"

	def thermo_confirmation(thermometer)
		@thermometer = thermometer
		# puts "*" * 50
		# puts @users.inspect
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
		mail(
				:to => "#{thermometer.email}",
				:subject => "Welcome to My Awesome Site"
		)
	end

	def thermo_max_violation(thermometer)
		@thermometer = thermometer
		puts "hello"
		mail(:to => "#{thermometer.email}", :subject => "Registered")
	end

	def thermo_not_updated(thermometer)
		@thermometer = thermometer
		puts "starfish"
		mail(:to => "#{thermometer.email}", :subject => "#{thermometer.name}" + "has not been updated")
	end
end

