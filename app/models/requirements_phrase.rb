class RequirementsPhrase < ApplicationRecord
  has_many :sponsor_conditions
  has_many :sponsor_proposals, through: :sponsor_conditions
  has_many :user_settings, as: :settable

  scope :for_sponsor, -> { where(purpose: :sponsor) }

  enum purpose: { sponsor: 0, project: 1 }
end
