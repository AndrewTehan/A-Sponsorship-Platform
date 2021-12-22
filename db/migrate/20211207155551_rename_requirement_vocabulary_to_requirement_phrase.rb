
class RenameRequirementVocabularyToRequirementPhrase < ActiveRecord::Migration[6.1]
  def change
    rename_table :requirements_vocabularies, :requirements_phrases
  end
end
