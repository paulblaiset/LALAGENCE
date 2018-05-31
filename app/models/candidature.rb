class Candidature < ApplicationRecord
  belongs_to :user
  belongs_to :url_flat, optional: true
  after_update :scrap

  private

  def scrap
    @flat = Flat.new
    @url = "https://www.orpi.com/annonce-location-appartement-t2-paris-14-75014-b-e0zav6/"
    url = self.url
    @flat = ScrapOrpi.new.create_flat_orpi
  end
end
