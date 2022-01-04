class RenameEntityIdToSettableId < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_settings, :entity_id, :settable_id
  end
end
