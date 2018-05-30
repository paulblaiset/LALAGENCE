class AddAgencyIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :agency, index: true
  end
end
