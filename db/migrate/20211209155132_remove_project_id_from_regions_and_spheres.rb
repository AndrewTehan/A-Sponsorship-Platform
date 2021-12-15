# frozen_string_literal: true

# this class is used for migration
class RemoveProjectIdFromRegionsAndSpheres < ActiveRecord::Migration[6.1]
  def change
    remove_column :spheres, :project_id
    remove_column :regions, :project_id
  end
end
