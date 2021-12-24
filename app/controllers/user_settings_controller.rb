class UserSettingsController < ApplicationController
  before_action :load_regions, :load_spheres, :load_requirements, only: :new

  def new
    @user_setting = UserSetting.new
  end

  def create
    @user_setting = UserSetting.new(user_setting_params)

    if @user_setting.save
      redirect_to users_my_settings_path
    else
      render :new
    end
  end

  def destroy
    @user_setting = UserSetting.find(params[:id])
    @user_setting.destroy

    redirect_to users_my_settings_path
  end

  private

  def load_regions
    @regions = Region.all
  end

  def load_requirements
    @conditions = RequirementsPhrase.for_sponsor
  end

  def load_spheres
    @spheres = Sphere.all
  end

  def user_setting_params
    params.require(:user_setting).permit( :settable_id )
  end
end
