class AddColumnIdToProjectsSpheres < ActiveRecord::Migration[6.1]
  def change
    add_column :projects_spheres, :id, :integer, primary_key: true
  end
end
