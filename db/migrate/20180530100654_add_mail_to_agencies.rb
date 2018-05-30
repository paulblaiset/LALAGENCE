class AddMailToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :mail, :string
  end
end
