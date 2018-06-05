class AddDefaultValueToCandidatures < ActiveRecord::Migration[5.2]
  def change
    change_column :candidatures, :status, :string, :default => "pending"
  end
end
