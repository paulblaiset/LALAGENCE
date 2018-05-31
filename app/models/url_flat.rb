class UrlFlat < ApplicationRecord
  has_many :candidatures, dependent: :destroy
  belongs_to :flat
end
