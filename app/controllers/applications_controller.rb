class ApplicationsController < ApplicationController

  def scrap_orpi
    ScarpOrpi.new(self).call
  end

  def edit
  @user = current_user
  @application = Application.find(params[:id])
  authorize @application
  end

end
