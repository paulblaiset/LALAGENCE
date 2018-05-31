class GuarantorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    is_user_current?
  end

  def update?
    is_user_current?
  end

  def destroy?
    is_user_current?
  end

  def home?
    true
  end

  private

  def is_user_current?
    record.user == user
  end
end
