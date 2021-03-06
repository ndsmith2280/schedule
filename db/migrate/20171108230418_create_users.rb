class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :user_first_name
      t.string :user_last_name
      t.boolean :user_administrator
      t.integer :user_priority
      t.string :user_phone_number
      t.string :email
      t.string :password_digest
    end
  end
end
