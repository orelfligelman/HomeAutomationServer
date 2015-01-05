class UserMailer < ApplicationMailer
  default :from => "orelmfligelman@gmail.com"

  def registration_confirmation(user)
    @user = user
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

  def email_update_destroy (user)
  	@user = user
   mail(:to => "#{user.name} <#{user.email}>", :subject => "Thermometer Say Bye-Bye")
  end
end