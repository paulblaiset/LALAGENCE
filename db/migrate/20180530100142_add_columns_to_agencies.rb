class AddColumnsToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :address, :string
    add_column :agencies, :phone_number, :string
    add_column :agencies, :siret, :string
  end
end
