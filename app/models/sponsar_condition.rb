# frozen_string_literal: true

class SponsorCondition < ApplicationRecord
  has_many :requirement_vocabularys
  belongs_to :sponsor_proposal
end
