class RenameColumnRegionToNameInRegions < ActiveRecord::Migration[6.1]
  def change
    rename_column :regions, :region, :name
  end
end
