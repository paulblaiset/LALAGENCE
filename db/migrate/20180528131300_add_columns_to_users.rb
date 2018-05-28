class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :mail, :string
    add_column :users, :phone_number, :string
    add_column :users, :work_situation, :string
    add_column :users, :job_name, :string
    add_column :users, :salary_by_month, :float
    add_column :users, :first_day_of_work, :date
    add_column :users, :rental_status, :string
    add_column :users, :year_legal_income, :float
    add_column :users, :actual_rent_price, :float
    add_column :users, :birthday_date, :date
    add_column :users, :employment_contract, :string
    add_column :users, :identity_card, :string
    add_column :users, :pay_slip_1, :string
    add_column :users, :pay_slip_2, :string
    add_column :users, :pay_slip_3, :string
    add_column :users, :actual_rent_bill, :string
    add_column :users, :tax_notice, :string
  end
end
