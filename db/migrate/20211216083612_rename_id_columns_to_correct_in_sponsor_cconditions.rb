class RenameIdColumnsToCorrectInSponsorCconditions < ActiveRecord::Migration[6.1]
  def change
    rename_column :sponsor_conditions, :proposal_id, :sponsor_proposal_id
    rename_column :sponsor_conditions, :requirement_id, :requirements_phrase_id
  end
end
