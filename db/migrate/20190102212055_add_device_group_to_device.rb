class AddDeviceGroupToDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :device_group, :string
  end
end
