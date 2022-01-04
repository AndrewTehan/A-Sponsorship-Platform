class UsersController < ApplicationController
  def my_settings
    @user_settings = current_user.user_settings
  end
end
