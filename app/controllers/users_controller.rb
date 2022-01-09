class UsersController < ApplicationController
  before_action :init_user, only: %i[show edit update]

  def settings
    @user_settings = current_user.user_settings
  end

  def home; end

  def about; end

  def show; end

  def user_comments
    @user_comments = current_user.comments
  end

  def user_projects
    @user_projects = current_user.projects.page params[:page]
  end

  def user_proposals
    @user_proposals = current_user.sponsor_proposals
  end

  def destroy
    current_user.destroy
  end

  def edit;  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def init_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:nick, :email)
  end
end
