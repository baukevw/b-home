class AddDeviseTypeToDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :device_type, :integer
  end
end
