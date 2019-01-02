module Bhome
  module Entities
    class DeviceEntity < Grape::Entity
      expose :id
      expose :name
      expose :device_type
      expose :icon
      expose :in_use
      expose :device_group
      expose :api_get_url
      expose :api_get_request_type
      expose :api_get_request_headers
      expose :api_get_request_body
      expose :api_get_request_actions
      expose :api_get_expected_response
      expose :api_set_url
      expose :api_set_request_type
      expose :api_set_request_headers
      expose :api_set_request_body
      expose :api_set_request_actions
      expose :api_set_expected_response
    end
  end
end
