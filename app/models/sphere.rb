# frozen_string_literal: true

class Sphere < ApplicationRecord
  has_many :projects_spheres
  has_many :projects, through: :projects_spheres

  validates :sphere, presence: true
end
