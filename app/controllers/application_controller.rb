class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nick, :email, :password, :role, :about_me) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:nick,
               :email,
               :password,
               :about_me,
               :password_confirmation,
               :current_password,
               :user_settings)
    end
  end
end
