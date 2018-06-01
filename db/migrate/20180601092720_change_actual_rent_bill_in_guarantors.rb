class ChangeActualRentBillInGuarantors < ActiveRecord::Migration[5.2]
  def change
    change_column_default :guarantors, :actual_rent_bill, nil
  end
end
