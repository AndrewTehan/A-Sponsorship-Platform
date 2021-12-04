# frozen_string_literal: true

class CreateSponsorConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :sponsor_conditions do |t|
      t.integer :proposal_id, null: false
      t.integer :requirement_id, null: false
      t.string :value, null: false

      t.timestamps
    end
  end
end
