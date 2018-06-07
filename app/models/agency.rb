class Agency < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :candidatures, through: :flats #Les agences ont plusieurs candidatures en passant par flats (voir schema DB)
  validates :address, uniqueness: true
end
