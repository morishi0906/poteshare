class CreateLents < ActiveRecord::Migration[5.2]
  def change
    create_table :lents do |t|
      t.date :startday
      t.date :endday
      t.integer :people
      t.integer :room_id
      t.integer :user_id
      t.integer :price

      t.timestamps
    end
  end
end
