class ApplicationController < ActionController::Base
  before_action :authenticate_user!
	helper_method :current_user
	protect_from_forgery with: :exception

		protected

	# def configure_permitted_parameters
	# 	devise_parameter_sanitizer.for(:sign_up) << :name
	# end
    # if params[:action] == 'update'
    #   devise_parameter_sanitizer.for(:account_update) {
    #     |u| u.permit(registration_params << :current_password)
    #   }
    # elsif params[:action] == 'create'
    #   devise_parameter_sanitizer.for(:sign_up) {
    #     |u| u.permit(registration_params)
    #   }
    # end
  end
