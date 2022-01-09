class SponsorProposal < ApplicationRecord
  has_many :sponsor_conditions, dependent: :destroy
  has_many :requirements_phrases, through: :sponsor_conditions

  accepts_nested_attributes_for :sponsor_conditions

  belongs_to :project
  belongs_to :user

  enum status: { unblocked: 0, rejected: 1 }
end
