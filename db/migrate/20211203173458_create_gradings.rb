class CreateGradings < ActiveRecord::Migration[6.1]
  def change
    create_table :gradings do |t|
      t.integer :criterion, null: false
      t.integer :mark, limit: 1, null: false
      t.integer :user_id, null: false
      t.integer :project_id, null: false

      t.timestamps
    end
  end
end
