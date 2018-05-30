class AddColumnToGuarantors < ActiveRecord::Migration[5.2]
  def change
    add_column :guarantors, :employer, :string
    add_column :guarantors, :seniority, :string
    add_column :guarantors, :employer_address, :string
    add_column :guarantors, :employer_phone_number, :string
    add_column :guarantors, :property_tax, :string
  end
end
