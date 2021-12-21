class RenameColumnSphereToNameInSpheres < ActiveRecord::Migration[6.1]
  def change
    rename_column :spheres, :sphere, :name
  end
end
