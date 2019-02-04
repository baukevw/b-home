class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.integer :frequency
      t.boolean :inversed, default: false
      t.text :jids
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
