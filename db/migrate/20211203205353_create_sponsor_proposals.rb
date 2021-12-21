class CreateSponsorProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :sponsor_proposals do |t|
      t.integer :project_id, null: false
      t.integer :user_id, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
