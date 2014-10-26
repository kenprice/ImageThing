class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :email
      t.string :name
      t.integer :profile_img
      t.text :profile_bio

      t.timestamps
    end
  end
end
