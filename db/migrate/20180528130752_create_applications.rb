class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.references :user, foreign_key: true
      t.references :url_flat, foreign_key: true

      t.timestamps
    end
  end
end
