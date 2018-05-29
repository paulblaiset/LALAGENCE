class Application < ApplicationRecord
  belongs_to :user
  belongs_to :url_flat, optional: true
end
