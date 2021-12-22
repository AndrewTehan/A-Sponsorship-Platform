class SponsorCondition < ApplicationRecord
  belongs_to :sponsor_proposal
  belongs_to :requirements_phrase
end
