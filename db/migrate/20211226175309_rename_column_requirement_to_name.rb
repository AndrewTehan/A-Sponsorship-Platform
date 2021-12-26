class RenameColumnRequirementToName < ActiveRecord::Migration[6.1]
  def change
    rename_column :requirements_phrases, :requirement, :name
  end
end
