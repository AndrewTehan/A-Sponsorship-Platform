class AddSponsorProposalSponsorConditionForiengKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :sponsor_conditions, :sponsor_proposals, column: :sponsor_proposal_id, primary_key: :id
  end
end
