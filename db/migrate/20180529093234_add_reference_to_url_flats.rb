class AddReferenceToUrlFlats < ActiveRecord::Migration[5.2]
  def change
    add_reference :url_flats, :flat, foreign_key: true
  end
end
