class CandidaturesController < ApplicationController
skip_before_action :authenticate_user!, only: [:show, :candidatures, :private_show] #pas besoin d'etre connecté pour aller sur les 3 pages de l'array



  def validate #pour valider une candidature
    @candidature = Candidature.find(params[:id])
    authorize @candidature
    @candidature.update!(status: "validate")
    redirect_to agency_path(@candidature.flats.first.agency)
  end

  def decline #pour refuser une candidature
    @candidature = Candidature.find(params[:id])
    authorize @candidature
    @candidature.update!(status: "declined")
    redirect_to agency_path(@candidature.flats.first.agency)
  end


  def index #pour afficher toutes les candidatures du user en fonction de son id
    @candidatures = policy_scope(Candidature).where(user_id: current_user.id)
  end


  def new
    @candidature = Candidature.new
    authorize @candidature
  end

  def create #création de la candidature par le particulier et envoie du mail à l'agence
    @candidature = Candidature.new(candidature_params)
    @candidature.user = current_user
    @candidature.url = @candidature.url.split("?").first
    authorize @candidature

    if @candidature.save
      UserMailer.folder(@candidature).deliver_now
      respond_to do |format|
        format.html { redirect_to edit_user_candidature_path [current_user, @candidature] } #rafraichissement de page
        format.js  # <-- will render `app/views/candidatures/update.js.erb`  #mode ajax
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js  # <-- idem
      end
    end
  end

  def edit
    @candidature = Candidature.find(params[:id])
    @user = @candidature.user
    authorize @candidature
  end

  def update
    @candidature = Candidature.find(params[:id])
    @candidature.assign_attributes(candidature_params) #mets à jour les champs concernés par candidature_params
    @candidature.url = @candidature.url.split("?").first
    @candidature.user = current_user
    authorize @candidature
    if @candidature.save
      UserMailer.folder(@candidature).deliver_now
      respond_to do |format|
        format.html { redirect_to edit_user_candidature_path(current_user) }
        format.js  # <-- will render `app/views/candidatures/update.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js  # <-- idem
      end
    end
  end

  def private_show #pour afficher la candidature lorsque l'agence n'a pas de compte, via le lien qu'on lui envoie dans le mail
    @candidature = Candidature.find_by(token: params[:token] )
    @user = @candidature.user
    @flat = @candidature.url_flat.flat

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

  def candidature_params #pour valider les champs qui peuvent être envoyés lors de la requete du formulaire (système de sécurité)
    params.require(:candidature).permit(:mail_agency, :url, :commentaire)
  end
end
