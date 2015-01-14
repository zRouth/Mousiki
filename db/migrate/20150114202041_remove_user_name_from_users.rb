class RemoveUserNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :user_name, :string
    add_column :users, :name, :string
  end
end
