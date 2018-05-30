class AddColumnsToGuarantors < ActiveRecord::Migration[5.2]
  def change
    add_column :guarantors, :rental_status, :string
    add_column :guarantors, :actual_rent_bill, :string, default: "0"
  end
end
