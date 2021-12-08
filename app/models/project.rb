# frozen_string_literal: true

class Project < ApplicationRecord
  has_and_belongs_to_many :regions
  has_and_belongs_to_many :spheres
  has_many :comments
  has_many :project_conditions
  has_many :sponsor_proposals
  has_many :gradings
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  # enum status: { public: 0, private: 1 }
end
