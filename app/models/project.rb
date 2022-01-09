require 'elasticsearch/model'

class Project < ApplicationRecord
  include Elasticsearch::Model

  has_and_belongs_to_many :regions
  has_and_belongs_to_many :spheres
  has_and_belongs_to_many :requirements_phrases

  has_many :comments, as: :commentable, dependent: :destroy

  has_many :project_conditions
  has_many :sponsor_proposals, dependent: :destroy
  has_many :gradings
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  paginates_per 5

  enum state: { active: 0, closed: 1 }
end

Project.__elasticsearch__.create_index!
Project.import
