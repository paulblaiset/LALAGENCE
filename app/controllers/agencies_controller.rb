require 'rubygems'

class AgenciesController < ApplicationController

  def show
    @agency = Agency.find(params[:id])
    authorize @agency
    @candidatures = @agency.candidatures
    @users = @candidatures.map(&:user)
    @flats = @agency.flats
  end

  def download
    input_filenames = []
    @user = User.find(params[:id])
    user_files = [@user.employment_contract, @user.identity_card, @user.pay_slip_1, @user.pay_slip_2, @user.pay_slip_3, @user.actual_rent_bill, @user.tax_notice]
    user_files.each do |doc|
      file = File.open("/tmp/docment-#{rand(100)}.jpg", "w") { |f| IO.copy_stream(open(doc.url), f) }
      input_filenames << file.path
    end
    folder = Rails.root
    zipfile_name = "/tmp/candidature.zip"
    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |filename|
      zipfile.add(filename, File.join(folder, filename))
      end
    end
    send_file(
      "#{Rails.root}/#{zipfile_name}",
      filename: "candidatures.zip",
      type: "application/zip"
    )
  end
end
