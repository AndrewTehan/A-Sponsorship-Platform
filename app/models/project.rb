# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :projects_regions
  has_many :regions, through: :projects_regions

  accepts_nested_attributes_for :projects_regions

  has_many :projects_spheres
  has_many :spheres, through: :projects_spheres

  accepts_nested_attributes_for :projects_regions

  has_many :comments
  has_many :project_conditions
  has_many :sponsor_proposals
  has_many :gradings
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  # enum status: { public: 0, private: 1 }
end
