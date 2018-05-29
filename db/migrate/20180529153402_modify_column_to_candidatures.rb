class ModifyColumnToCandidatures < ActiveRecord::Migration[5.2]
  def change
    remove_column :candidatures, :flat_id
    add_reference :candidatures, :url_flat, index: true
  end
end
