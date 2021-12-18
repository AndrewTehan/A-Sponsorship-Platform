class AddSponsorConditionRequirementForiengKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :sponsor_conditions, :requirements_phrases, column: :requirements_phrase_id, primary_key: :id
  end
end
