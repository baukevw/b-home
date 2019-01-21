class AddInverseOptionToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :inversed, :boolean, default: false
  end
end
