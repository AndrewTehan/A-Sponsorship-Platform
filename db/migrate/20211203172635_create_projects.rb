# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :description, null: false, default: ""
      t.integer :status, null: false, default: 0
      t.integer :views_number, null: false, default: 0
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
