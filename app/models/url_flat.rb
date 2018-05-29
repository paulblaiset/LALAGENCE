class UrlFlat < ApplicationRecord
  has_many :applications
  belongs_to :flat
end
