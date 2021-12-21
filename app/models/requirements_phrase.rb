class RequirementsPhrase < ApplicationRecord
  has_many :sponsor_conditions
  has_many :sponsor_proposals, through: :sponsor_conditions

  enum purpose: { sponsor: 0, project: 1 }
end
