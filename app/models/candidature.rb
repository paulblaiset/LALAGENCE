class Candidature < ApplicationRecord
  belongs_to :user
  belongs_to :url_flat, optional: true
  after_update :scrap
  after_create :create_token

  private

  def create_token
    token = SecureRandom.hex(10)
    self.token = token
    self.save
  end


  def scrap
    return if url.nil?
    @url = self.url
    @flat = Flat.joins(:url_flats).where("url_flats.url_1 = ? OR url_flats.url_2 = ? OR url_flats.url_3 = ? ", @url, @url, @url).first
    unless @flat
      if @url.match("orpi")
        @flat = Flat.new
        @url_orpi = self.url
        @flat = ScrapOrpi.new.create_flat_orpi(@url_orpi)
      elsif @url.match("logic-immo")
        @flat = Flat.new
        @url_logic_immo = self.url
        @flat = ScrapLogicImmo.new.create_flat_logic_immo(@url_logic_immo)
      elsif @url.match("leboncoin")
        @flat = Flat.new
        @url_lbc = self.url
        @flat = ScrapLbc.new.create_flat_lbc(@url_lbc)
      else
        @flat = Flat.new(title: "Url non trouvée")
      end

      @flat.save

      url_flat = self.url_flat
      if url_flat.nil?
        url_flat = UrlFlat.new(url_1: url, flat: @flat)
      else
        url_flat.flat = @flat
        if url_flat.url_1.present?
          if url_flat.url_2.present?
            url_flat.url_3 = url
          else
            url_flat.url_2 = url
          end
        else
          url_flat.url_1 = url
        end
      end


      url_flat.save

      self.update_column(:url_flat_id, url_flat.id)
    end
  end


end
