class HomeController < ApplicationController
	def index
		if user_signed_in?
			redirect_to :controller=>'contacts', :action => 'index'
		else
			@user = User.all
		end
	end
end
