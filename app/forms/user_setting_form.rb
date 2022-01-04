class UserSettingForm
  include ActiveModel::Model
  attr_accessor :region_ids, :sphere_ids, :requirement_ids, :user_id
end
