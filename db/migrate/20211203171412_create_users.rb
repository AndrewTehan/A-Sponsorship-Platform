# frozen_string_literal: true

# this class is used for migration
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nick, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :about_me, null: false, default: ''
      t.integer :role, null: false, default: 0

      t.timestamps
    end
  end
end
