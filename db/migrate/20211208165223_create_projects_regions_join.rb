class CreateProjectsRegionsJoin < ActiveRecord::Migration[6.1]
  def self.up
    create_table :projects_regions, id: false do |t|
      t.column :project_id, :integer
      t.column :region_id, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :projects_regions
  end
end
