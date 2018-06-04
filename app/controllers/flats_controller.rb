class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @agency = Agency.find(params[:agency_id])
    @flats = policy_scope(Flat)
  end


  def new
    @agency = Agency.find(params[:agency_id])
    @flat = Flat.new
    @url_flat = UrlFlat.new
    authorize @flat
  end

  def create
    url = params[:flat][:url].split("?").first
    url_flat = UrlFlat.find_by("url_1 = ? OR url_2 = ? OR url_3 = ?", url, url, url)
    if url_flat.nil?
      if url.match("orpi")
        @url_orpi = url
        @flat = ScrapOrpi.new.create_flat_orpi(@url_orpi)
      elsif url.match("logic-immo")
        @url_logic_immo = url
        @flat = ScrapLogicImmo.new.create_flat_logic_immo(@url_logic_immo)
      elsif url.match("leboncoin")
        @url_lbc = url
        @flat = ScrapLbc.new.create_flat_lbc(@url_lbc)
      else
        @flat = Flat.new(title: "Url non trouvée")
      end
      authorize @flat
      @flat.save
    else
      @flat = url_flat.flat
    end
    authorize @flat
    @flat.agency = Agency.find(params[ :agency_id ])
    @flat.save

    if url_flat.nil?
      url_flat = UrlFlat.new(url_1: url, flat: @flat)
    else
      url_flat.flat = @flat
      # if url_flat.url_1.present?
      #   if url_flat.url_2.present?
      #     url_flat.url_3 = url
      #   else
      #     url_flat.url_2 = url
      #   end
      # else
      #   url_flat.url_1 = url
      # end
    end


    url_flat.save
    redirect_to agency_flats_path(@flat.agency)
  end

end
