require 'zip'

class AgenciesController < ApplicationController
  skip_after_action :verify_authorized, only: [:download] #Pas de vérification après le download

  def show #Pour afficher tous les appartements par agence, il faut trouver l'agence concernée et les candidatures associées
    @agency = Agency.find(params[:id])
    authorize @agency                    #authorize --> Gem Pundit (vérification des droits)
    @candidatures = @agency.candidatures
    @users = @candidatures.map(&:user)
    @flats = @agency.flats
  end

  def download
    @user = User.find(params[:id])
    user_files = [@user.employment_contract, @user.identity_card, @user.pay_slip_1, @user.pay_slip_2, @user.pay_slip_3, @user.actual_rent_bill, @user.tax_notice]
    filename = 'candidature.zip'
    temp_file = Tempfile.new(filename)
    Zip::OutputStream.open(temp_file) { |zos| }
    Zip::File.open(temp_file.path, Zip::File::CREATE) do |zip|
      user_files.each do |doc|
        path = "#{Rails.root}/tmp/#{doc.mounted_as}"
        File.open(path, "w") { |f| IO.copy_stream(open(doc.url), f) }
        zip.add(doc.mounted_as, path)
      end
    end
    send_data(
      File.read(temp_file.path),
      filename: "candidatures.zip",
      type: "application/zip"
    )
    temp_file.close
    temp_file.unlink
  end
end
