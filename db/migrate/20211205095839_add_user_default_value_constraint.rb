class AddUserDefaultValueConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :nick, :string, default: ''
    change_column :users, :about_me, :string, default: ''
  end
end
