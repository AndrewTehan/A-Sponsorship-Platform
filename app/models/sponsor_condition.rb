# frozen_string_literal: true

class SponsorCondition < ApplicationRecord
  has_many :requirements_phrases
  belongs_to :sponsor_proposal
end
