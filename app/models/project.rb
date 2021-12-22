class Project < ApplicationRecord
  scope :businessman_own_projects, -> { where(user_id: c) }

  has_and_belongs_to_many :regions
  has_and_belongs_to_many :spheres
  has_and_belongs_to_many :requirements_phrases

  has_many :comments, as: :commentable

  has_many :project_conditions
  has_many :sponsor_proposals
  has_many :gradings
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  # enum status: { public: 0, private: 1 }
end
