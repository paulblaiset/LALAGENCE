class RemoveApplicationIdFromUrlFlats < ActiveRecord::Migration[5.2]
  def change
    remove_column :url_flats, :application_id
  end
end
