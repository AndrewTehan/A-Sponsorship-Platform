class AddCommentableIdAndCommentableTypeToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :commentable_id, :integer, null: false
    add_column :comments, :commentable_type, :string, null: false
  end
end
