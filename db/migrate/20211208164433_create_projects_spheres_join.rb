# frozen_string_literal: true

# this class is used for migration
class CreateProjectsSpheresJoin < ActiveRecord::Migration[6.1]
  def self.up
    create_table :projects_spheres, id: false do |t|
      t.column :project_id, :integer
      t.column :sphere_id, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :projects_spheres
  end
end
