# frozen_string_literal: true

# this class is used for migration
class AddColumnIdToProjectsRegions < ActiveRecord::Migration[6.1]
  def change
    add_column :projects_regions, :id, :integer, primary_key: true
  end
end
