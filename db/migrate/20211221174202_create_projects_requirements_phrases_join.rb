class CreateProjectsRequirementsPhrasesJoin < ActiveRecord::Migration[6.1]
  def self.up
    create_table :projects_requirements_phrases do |t|
      t.column :project_id, :integer
      t.column :requirements_phrase_id, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :projects_requirements_phrases
  end
end
