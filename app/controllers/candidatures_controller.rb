class CandidaturesController < ApplicationController
  def scrap_orpi
    ScarpOrpi.new(self).call
  end

  def index
    @candidatures = policy_scope(Candidature).where(user_id: current_user.id)
  end

  def edit
  @candidature = Candidature.find(params[:id])
  @user = @candidature.user
  authorize @candidature
  end

  def show
  @candidature = Candidature.find(params[:id])
  @user = @candidature.user
  authorize @candidature
  end

end
