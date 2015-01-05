class ThermometerMailer < ApplicationMailer
  default :from => "orelmfligelman@gmail.com"

  def thermo_confirmation(user)
    @user = user
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
