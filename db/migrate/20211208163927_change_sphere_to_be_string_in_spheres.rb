class ChangeSphereToBeStringInSpheres < ActiveRecord::Migration[6.1]
  def up
    change_column :spheres, :sphere, :string
  end

  def down
    change_column :spheres, :sphere, :integer
  end
end
