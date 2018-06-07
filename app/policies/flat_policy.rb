class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(agency_id: user.agency_id) unless user.agency_id.nil?
    end
  end

  def show
    user.agency
  end

  def create?
    true
  end
end
