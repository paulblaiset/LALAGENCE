class AddColumnsToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :photo, :string
    add_column :flats, :nb_room, :string
    add_column :flats, :address, :string
    add_column :flats, :price, :string
    add_column :flats, :surface, :string
  end
end
