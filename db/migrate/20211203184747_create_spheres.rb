# frozen_string_literal: true

class CreateSpheres < ActiveRecord::Migration[6.1]
  def change
    create_table :spheres do |t|
      t.integer :sphere, null: false
      t.integer :project_id, null: false

      t.timestamps
    end
  end
end
