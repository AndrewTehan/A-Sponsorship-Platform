module UserSettings
  class Creator
    def initialize(user_setting_params, current_user)
      @user_setting_params = user_setting_params
      @current_user = current_user
    end

    def call
      @user_setting_params[:region_ids].each do|region|
        UserSetting.create(user_id: @current_user.id, settable_id: region, settable_type: "Region")
      end

      @user_setting_params[:sphere_ids].each do|sphere|
        UserSetting.create(user_id: @current_user.id, settable_id: sphere, settable_type: "Sphere")
      end

      @user_setting_params[:requirement_ids].each do|requirement|
        UserSetting.create(user_id: @current_user.id, settable_id: requirement, settable_type: "RequirementsPhrase")
      end
    end

    private

    def regions
      Region.where(id: @user_setting_params[:region_ids])
    end

    def spheres
      Sphere.where(id: @user_setting_params[:sphere_ids])
    end

    def requirements
      RequirementsPhrase.where(id: @user_setting_params[:requirement_ids])
    end

    def project_properties
      @user_setting_params.slice(:title, :description)
    end
  end
end