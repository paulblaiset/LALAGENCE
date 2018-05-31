class FlatsController < ApplicationController

  def index
    @flats = policy_scope(Flat).where(agency_id: current_user.agency_id)
  end


end
