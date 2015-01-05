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
         :recoverable, :rememberable, :trackable, :validatable


   	# serialize :preferences, Hash
end
