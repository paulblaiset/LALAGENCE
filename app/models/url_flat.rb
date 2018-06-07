class UrlFlat < ApplicationRecord
  has_many :candidatures, dependent: :destroy #si on supprime un url_flat, on supprime les candidatures qui ont l'url_flat_id concerné
  belongs_to :flat
end
