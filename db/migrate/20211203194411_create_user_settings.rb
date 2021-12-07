# frozen_string_literal: true

# this class is used for migration
class CreateUserSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_settings do |t|
      t.integer :user_id, null: false
      t.integer :entity_id, null: false
      t.string :entity_name, null: false

      t.timestamps
    end
  end
end
