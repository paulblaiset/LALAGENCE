class Flat < ApplicationRecord
  belongs_to :agency
  has_many :url_flats
end
