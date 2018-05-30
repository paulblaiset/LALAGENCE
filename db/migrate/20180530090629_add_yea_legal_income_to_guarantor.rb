class AddYeaLegalIncomeToGuarantor < ActiveRecord::Migration[5.2]
  def change
    add_column :guarantors, :year_legal_income, :string
  end
end
