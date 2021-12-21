class UserSetting < ApplicationRecord
  has_many :entity, polymorphic: true
  belongs_to :user
end
