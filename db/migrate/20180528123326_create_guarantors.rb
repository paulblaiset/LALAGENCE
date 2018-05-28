class CreateGuarantors < ActiveRecord::Migration[5.2]
  def change
    create_table :guarantors do |t|
      t.string :gender
      t.string :first_name
      t.string :last_name
      t.date :birthday_date
      t.text :address
      t.string :nationality
      t.string :couple_status
      t.string :mail
      t.integer :child_number
      t.string :job_name
      t.string :employment_contract
      t.string :identity_card
      t.string :pay_slip_1
      t.string :pay_slip_2
      t.string :pay_slip_3
      t.string :tax_notice
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
