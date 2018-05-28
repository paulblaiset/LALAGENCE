class RemoveUrlFlatIdFromApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :url_flat_id
  end
end
