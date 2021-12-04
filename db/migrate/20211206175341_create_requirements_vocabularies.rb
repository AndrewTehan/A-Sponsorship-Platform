class CreateRequirementsVocabularies < ActiveRecord::Migration[6.1]
  def change
    create_table :requirements_vocabularies do |t|
      t.string :type
      t.string :requirement

      t.timestamps
    end
  end
end
