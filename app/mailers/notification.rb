class Notification < ActionMailer::Base
   default :from => "orelmfligelman@gmail.com"

  # def send_update
  # 	@users = users
  # 	mail(:to => "#{users.name}" , "#{users.email)}", :subject => "Temperature Reading Alert")
  # end
end
