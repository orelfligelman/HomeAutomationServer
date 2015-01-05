class Notification < ActionMailer::Base
   default :from => "orelmfligelman@gmail.com"

  def send_update
  	@user = user
  	mail(:to => "#{user.name} <#{user.email)}>", :subject => "Temperature Reading Alert")
  end
end
