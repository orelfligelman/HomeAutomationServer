class User < ActiveRecord::Base
	has_many :thermometers
	validates_acceptance_of :terms, :privacy_policy #default acceptance is 1, value provided by rails helper for checkboxes
	validates_associated :thermometers
	validates_confirmation_of :password
	rolify
	# For gravatar
	include Gravtastic
	gravtastic


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
				 :omniauthable, :omniauth_providers => [:google_oauth2]

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
			end
		end
	end
	# def google_oauth2
	# 	# You need to implement the method below in your model (e.g. app/models/users.rb)
	# 	@user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
	#
	# 	if @user.persisted?
	# 		flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
	# 		sign_in_and_redirect @user, :event => :authentication
	# 	else
	# 		session["devise.google_data"] = request.env["omniauth.auth"]
	# 		redirect_to new_user_registration_url
	# 	end
	# end
	#
	# def self.from_omniauth(auth)
	# 	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	# 		user.provider = auth.provider
	# 		user.uid = auth.uid
	# 		user.name = auth.info.name
	# 		user.oauth_token = auth.credentials.token
	# 		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	# 		user.save!
	# 	end
	# end

# 	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
# 		data = access_token.info
# 		user = User.where(:email => data["email"]).first
#
# 		unless users
# 		    users = User.create(name: data["name"],
# 		       email: data["email"],
# 		       password: Devise.friendly_token[0,20]
# 		    )
# 		end
# 		user
# 	end
# end
