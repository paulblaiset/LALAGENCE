class ChangeColumnUrlFlatToUrl < ActiveRecord::Migration[5.2]
  def change
    rename_column :candidatures, :url_flat, :url
  end
end
