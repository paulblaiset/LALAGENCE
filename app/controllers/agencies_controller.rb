class AgenciesController < ApplicationController

  def show
    @agency = Agency.find(params[:id])
    authorize @agency
    @candidatures = @agency.candidatures
    @users = @candidatures.map(&:user)
  end




end
