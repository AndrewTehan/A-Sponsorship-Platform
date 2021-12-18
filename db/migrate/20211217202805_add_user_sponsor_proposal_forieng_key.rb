class AddUserSponsorProposalForiengKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :sponsor_proposals, :users, column: :user_id, primary_key: :id
  end
end
