class CreateCandidatures < ActiveRecord::Migration[5.2]
  def change
    create_table :candidatures do |t|
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
