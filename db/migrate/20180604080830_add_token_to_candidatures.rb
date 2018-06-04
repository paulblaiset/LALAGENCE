class AddTokenToCandidatures < ActiveRecord::Migration[5.2]
  def change
    add_column :candidatures, :token, :string
  end
end
