class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nick, :email, :password, :role, :about_me, :password_confirmation) }
  end

  def user_not_authorized
    redirect_to(request.referrer || rootpath)
  end
end
