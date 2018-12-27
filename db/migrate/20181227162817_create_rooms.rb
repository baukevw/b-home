class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :icon
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
