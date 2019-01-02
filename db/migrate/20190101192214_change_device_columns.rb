class ChangeDeviceColumns < ActiveRecord::Migration[5.2]
  def change

    rename_column :devices, :api_url, :api_set_url
    rename_column :devices, :api_request_headers, :api_set_request_headers
    rename_column :devices, :api_request_type, :api_set_request_type
    rename_column :devices, :api_request_body, :api_set_request_body
    rename_column :devices, :api_request_actions, :api_set_request_actions
    rename_column :devices, :api_expected_response, :api_set_expected_response

    add_column :devices, :api_get_url, :string
    add_column :devices, :api_get_request_headers, :text
    add_column :devices, :api_get_request_type, :integer, default: 0
    add_column :devices, :api_get_request_body, :text
    add_column :devices, :api_get_request_actions, :text
    add_column :devices, :api_get_expected_response, :text
  end
end
