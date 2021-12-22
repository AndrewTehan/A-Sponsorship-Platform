class AddUserUserSettingForiengKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :user_settings, :users, column: :user_id, primary_key: :id
  end
end
