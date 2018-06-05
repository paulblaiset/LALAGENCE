class AddCommentairesToCandidatures < ActiveRecord::Migration[5.2]
  def change
    add_column :candidatures, :commentaire, :string
  end
end
