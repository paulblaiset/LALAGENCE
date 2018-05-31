class Flat < ApplicationRecord
  belongs_to :agency
  has_many :url_flats, dependent: :destroy
  has_many :candidatures, through: :url_flats
end
