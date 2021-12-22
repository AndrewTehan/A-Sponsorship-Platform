class AddProjectGradingForiengKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :gradings, :projects, column: :project_id, primary_key: :id
  end
end
