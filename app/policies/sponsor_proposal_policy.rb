class SponsorProposalPolicy < ApplicationPolicy
  def create?
    user.present? && user.role == "sponsor"
  end
end