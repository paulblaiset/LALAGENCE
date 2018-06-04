class AddUrlToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :url, :string
  end
end
