class Agency < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :candidatures, through: :flats
  validates :address, uniqueness: true
end
