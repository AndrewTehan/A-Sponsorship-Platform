# frozen_string_literal: true

class SponsorProposal < ApplicationRecord
  has_many :sponsor_conditions
  belongs_to :project

  enum status: { unblock: 0, rejected: 1 }
end
