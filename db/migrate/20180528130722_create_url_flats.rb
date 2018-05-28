class CreateUrlFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :url_flats do |t|
      t.text :url_1
      t.text :url_2
      t.text :url_3

      t.timestamps
    end
  end
end
