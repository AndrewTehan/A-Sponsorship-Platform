class Project < ApplicationRecord
  
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

  paginates_per 3

  enum state: { active: 0, close: 1 }
end
