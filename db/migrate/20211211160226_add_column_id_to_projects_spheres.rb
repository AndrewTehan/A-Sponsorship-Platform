# frozen_string_literal: true

# this class is used for migration
class AddColumnIdToProjectsSpheres < ActiveRecord::Migration[6.1]
  def change
    add_column :projects_spheres, :id, :integer, primary_key: true
  end
end
