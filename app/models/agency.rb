class Agency < ApplicationRecord
  has_many :flats
  has_many :users

  validates :address, uniqueness: true
end
