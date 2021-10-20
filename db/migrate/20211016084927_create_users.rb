class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :message
      t.string :mail
      t.string :password_digest
      t.string :lent_id
      t.string :user_img

      t.timestamps
    end
  end
end
