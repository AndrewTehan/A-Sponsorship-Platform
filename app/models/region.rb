class Region < ApplicationRecord
  has_and_belongs_to_many :projects
  has_many :user_settings, as: :settable
end
