class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :email
      t.string :password_digest
      t.string :session_token

      t.timestamps
    end
    add_index :user, :email, :unique => true
    add_index :user, :password_digest
    add_index :user, :session_token, :unique => true
  end
end
