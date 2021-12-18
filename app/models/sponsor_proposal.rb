# frozen_string_literal: true

class SponsorProposal < ApplicationRecord
  has_many :sponsor_conditions
  has_many :requirements_phrases, through: :sponsor_conditions

  belongs_to :project
  belongs_to :user

  enum status: { unblock: 0, rejected: 1 }
end
