class AddApplicationReferencesToUrlFlats < ActiveRecord::Migration[5.2]
  def change
    add_reference :url_flats, :application, foreign_key: true
  end
end
