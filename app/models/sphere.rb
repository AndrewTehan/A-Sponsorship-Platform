class Sphere < ApplicationRecord
  has_and_belongs_to_many :projects
end
