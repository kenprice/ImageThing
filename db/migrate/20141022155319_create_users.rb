class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.integer :profile_img
      t.text :profile_bio

      t.timestamps
    end
  end
end
