class CandidaturesController < ApplicationController
skip_before_action :authenticate_user!, only: [:show, :candidatures]

  def scrap_orpi
    ScarpOrpi.new(self).call
  end

  def index
    @candidatures = policy_scope(Candidature).where(user_id: current_user.id)
  end


  def new
    @candidature = Candidature.new
    authorize @candidature
  end

  def create
    @candidature = Candidature.new(candidature_params)
    @candidature.user = current_user
    authorize @candidature
    if @candidature.save
      redirect_to user_candidatures_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @candidature = Candidature.find(params[:id])
    @user = @candidature.user
    authorize @candidature
  end

  def update
    @candidature = Candidature.find(params[:id])
    @candidature.update(candidature_params)
    @candidature.user = current_user
    authorize @candidature
    if @candidature.save
      redirect_to user_candidatures_path(current_user)
    else
      render 'new'
    end

  end

  def show
    @candidature = Candidature.find(params[:id])
    @user = @candidature.user
    authorize @candidature
  end

  private

  def candidature_params
    params.require(:candidature).permit(:mail_agency, :url_flat)
  end

end
