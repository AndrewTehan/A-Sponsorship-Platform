class UserSettingsController < ApplicationController
  before_action :load_regions, :load_spheres, :load_requirements, only: :new

  def new
    @user_setting_form = UserSettingForm.new
  end

  def create
    @project = UserSettings::Creator.new(user_setting_params, current_user).call

    if @project
      redirect_to users_settings_path
    else
      render :new
    end
  end

  def destroy
    @user_setting = UserSetting.find(params[:id])
    @user_setting.destroy

    redirect_to users_settings_path
  end

  private

  def load_regions
    @regions = Region.all
  end

  def load_requirements
    @requirements = RequirementsPhrase.for_sponsor
  end

  def load_spheres
    @spheres = Sphere.all
  end

  def user_setting_params
    params.require(:user_setting_form).permit(:user_id, requirement_ids: [],sphere_ids: [], region_ids: [])
  end
end
