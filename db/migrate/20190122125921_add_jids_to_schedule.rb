class AddJidsToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :jids, :text
  end
end
