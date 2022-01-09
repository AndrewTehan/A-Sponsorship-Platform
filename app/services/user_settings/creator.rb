module UserSettings
  class Creator
    include SettableEntityHelper

    def initialize(user_setting_params, current_user)
      @user_setting_params = user_setting_params
      @current_user = current_user
    end

    def call
      [regions, spheres, requirements].each do |settable_entities|
        create_user_settings(settable_entities)
      end
    end

    private

    attr_reader :user_setting_params
    alias :entity_params :user_setting_params

    def create_user_settings(settable_entities)
      settable_entities.each do |settable_entity|
        UserSetting.create(user: @current_user, settable: settable_entity)
      end
    end
  end
end