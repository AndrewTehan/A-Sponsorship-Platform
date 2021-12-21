class CreateProjectConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :project_conditions do |t|
      t.integer :project_id, null: false
      t.integer :requirement_id, null: false

      t.timestamps
    end
  end
end
