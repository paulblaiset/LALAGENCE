class AgenciesController < ApplicationController

  def show
    @agency = Agency.find(params[:id])
    authorize @agency
    @candidatures = @agency.candidatures
  end




end
