class DropFlats < ActiveRecord::Migration[5.2]
  def change
    drop_table :flats
  end
end
