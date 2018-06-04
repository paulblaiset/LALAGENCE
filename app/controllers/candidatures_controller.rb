class CandidaturesController < ApplicationController
skip_before_action :authenticate_user!, only: [:show, :candidatures, :private_show]


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
      redirect_to edit_user_candidature_path(current_user)
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
      UserMailer.folder(@candidature).deliver_now
      respond_to do |format|
        format.html { redirect_to edit_user_candidature_path(current_user) }
        format.js  # <-- will render `app/views/candidatures/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js  # <-- idem
      end
    end
  end

  def private_show
    @candidature = Candidature.find_by(token: params[:token] )
    @user = @candidature.user
    authorize @candidature
  end


  def show
    @candidature = Candidature.find(params[:id])
    @user = @candidature.user
    @flat = @candidature.url_flat.flat

    @candidates = []
    @flat.candidatures.each do |candidature|
      @candidates << candidature.user
    end

    authorize @candidature
  end

  private

  def candidature_params
    params.require(:candidature).permit(:mail_agency, :url)
  end
end
