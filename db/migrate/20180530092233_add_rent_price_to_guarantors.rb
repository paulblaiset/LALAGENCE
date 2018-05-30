class AddRentPriceToGuarantors < ActiveRecord::Migration[5.2]
  def change
      add_column :guarantors, :actual_rent_price, :string
  end
end
