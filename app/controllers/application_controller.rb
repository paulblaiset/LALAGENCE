class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end



  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  protected

  def after_sign_in_path_for(resource) #si on se connecte en mode agence, on arrive sur le dashboard agence, sinon sur l'edit user
    if resource.agency_id
      @agency_id = current_user.agency_id
      agency_flats_path(@agency_id)
    else
      edit_user_path(current_user)
    end
  end



end
