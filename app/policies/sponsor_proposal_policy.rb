class ProjectPolicy < ApplicationPolicy
  def create?
    user.present? && user.role == "sponsor"
  end
end