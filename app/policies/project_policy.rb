class ProjectPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.present? && user.role == 'businessman'
  end

  def create?
    user.present? && user.role == 'businessman'
  end

  def edit?
    user.present? && user.id == record.user_id
  end

  def update?
    return true if user.present? && user.id == record.user_id
  end

  def destroy?
    return true if user.present? && user.id == record.user_id
  end
end
