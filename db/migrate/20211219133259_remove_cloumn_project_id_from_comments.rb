class RemoveCloumnProjectIdFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :project_id
  end
end
