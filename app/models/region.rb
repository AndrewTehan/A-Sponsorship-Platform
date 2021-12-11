# frozen_string_literal: true

class Region < ApplicationRecord
  has_many :projects_regions
  has_many :projects, through: :projects_regions

  validates :region, presence: true
end
