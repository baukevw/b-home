json.extract! device, :id, :name, :icon, :api_url, :api_request_type, :api_request_headers, :api_request_body, :api_request_actions, :api_expected_response, :created_at, :updated_at
json.url device_url(device, format: :json)
