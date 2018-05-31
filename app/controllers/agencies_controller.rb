class AgenciesController < ApplicationController

  def show
    @agency = Agency.find(params[:id])
    authorize @agency
    @candidatures = @agency.candidatures
  end



    query = "SELECT * FROM transactions
    JOIN socks ON transactions.sock_id = socks.id
     WHERE socks.user_id = ?"

end
