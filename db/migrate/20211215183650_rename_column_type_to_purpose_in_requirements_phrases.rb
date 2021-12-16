class RenameColumnTypeToPurposeInRequirementsPhrases < ActiveRecord::Migration[6.1]
  def change
    rename_column :requirements_phrases, :type, :purpose
  end
end
