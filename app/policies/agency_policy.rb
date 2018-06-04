class AgencyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    record.id == user.agency_id
  end

  def show?
    true
  end
end
