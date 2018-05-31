class AddColumnToCandidatures < ActiveRecord::Migration[5.2]
  def change
    add_column :candidatures, :mail_agency, :string
    add_column :candidatures, :url_flat, :string
  end
end
