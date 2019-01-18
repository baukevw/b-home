class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :icon
      t.integer :device_type
      t.string :current_state
      t.string :mqtt_topic
      t.string :mqtt_on_message
      t.string :mqtt_off_message
      t.string :mqtt_state_topic
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
