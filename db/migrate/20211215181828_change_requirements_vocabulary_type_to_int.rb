class ChangeRequirementsVocabularyTypeToInt < ActiveRecord::Migration[6.1]
  def up
    remove_column :requirements_phrases, :type
    add_column :requirements_phrases, :type, :integer, :limit => 2
  end

  def down
    remove_column :requirements_phrases, :type
    create_column :requirements_phrases, :type, :string
  end
end
