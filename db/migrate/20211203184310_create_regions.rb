# frozen_string_literal: true

class CreateRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.string :region, null: false
      t.integer :project_id, null: false

      t.timestamps
    end
  end
end
