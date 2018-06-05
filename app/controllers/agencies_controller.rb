require 'zip'

class AgenciesController < ApplicationController
  skip_after_action :verify_authorized, only: [:download]

  def show
    @agency = Agency.find(params[:id])
    authorize @agency
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
