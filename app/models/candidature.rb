class Candidature < ApplicationRecord
  belongs_to :user
  belongs_to :url_flat, optional: true
  after_update :scrap


  private

  def scrap
    @url = self.url
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
    url_flat = UrlFlat.first_or_create(flat: @flat)

    self.update_column(:url_flat_id, url_flat.id)
  end


end
