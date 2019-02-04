class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      enable_extension 'hstore' unless extension_enabled?('hstore')
      t.string :name
      t.string :icon
      t.integer :device_type
      t.string :current_state
      t.string :mqtt_topic
      t.string :mqtt_state_topic
      t.hstore :data
      t.references :room, foreign_key: true

      t.timestamps
    end
    add_index :devices, :data, using: :gin
  end
end
