class RenameEntityNameToSettableType < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_settings, :entity_name, :settable_type
  end
end
