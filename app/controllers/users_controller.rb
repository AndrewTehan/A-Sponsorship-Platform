class UsersController < ApplicationController
  def index; end

  def my_settings
    @user_settings = current_user.user_settings
  end
end
