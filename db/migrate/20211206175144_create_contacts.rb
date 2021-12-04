class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :phone_number
      t.string :skype
      t.string :telegram
      t.integer :user_id

      t.timestamps
    end
  end
end
