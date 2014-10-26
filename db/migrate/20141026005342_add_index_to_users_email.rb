class AddIndexToUsersEmail < ActiveRecord::Migration
  #Added index for users email field to avoid duplicate dbase entries
  def change
    add_index :users, :email, unique: true
  end
end
