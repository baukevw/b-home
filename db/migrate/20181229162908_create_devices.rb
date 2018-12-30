class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :icon
      t.string :api_url
      t.integer :api_request_type, default: 0
      t.text :api_request_headers
      t.text :api_request_body
      t.text :api_request_actions
      t.text :api_expected_response
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
