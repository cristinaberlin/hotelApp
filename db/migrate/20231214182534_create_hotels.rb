class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :name_room
      t.string :price
      t.string :full_name
      t.string :email

      t.timestamps
    end
  end
end
