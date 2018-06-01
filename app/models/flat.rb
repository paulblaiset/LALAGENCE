class Flat < ApplicationRecord
  belongs_to :agency, optional: true
  has_many :url_flats, dependent: :destroy
  has_many :candidatures, through: :url_flats

  mount_uploader :photo, PhotoUploader
end
