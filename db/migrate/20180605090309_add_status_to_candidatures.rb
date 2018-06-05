class AddStatusToCandidatures < ActiveRecord::Migration[5.2]
  def change
    add_column :candidatures, :status, :string
  end
end
