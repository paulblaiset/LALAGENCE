class CandidaturesController < ApplicationController
  def scrap_orpi
    ScarpOrpi.new(self).call
  end

  def edit
  @user = current_user
  @candidature = Candidature.find(params[:id])
  authorize @candidature
  end

end
