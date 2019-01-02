class AddInUseToDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :in_use, :boolean, default: false
  end
end
