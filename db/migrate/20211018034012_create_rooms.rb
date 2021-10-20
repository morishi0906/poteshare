class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :room_message
      t.integer :price
      t.string :address
      t.string :room_img
      t.string :register

      t.timestamps
    end
  end
end
