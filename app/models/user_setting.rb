class UserSetting < ApplicationRecord
  belongs_to :user
  belongs_to :settable, polymorphic: true
end
