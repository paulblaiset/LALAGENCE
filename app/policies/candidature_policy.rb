class CandidaturePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def update?
    true
  end

  def create?
    true
  end

  def private_show?
    true
  end
end
