# == Schema Information
#
# Table name: devices
#
#  id                        :bigint(8)        not null, primary key
#  name                      :string
#  icon                      :string
#  api_set_url               :string
#  api_set_request_type      :integer          default("get")
#  api_set_request_headers   :text
#  api_set_request_body      :text
#  api_set_request_actions   :text
#  api_set_expected_response :text
#  room_id                   :bigint(8)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  device_type               :integer
#  api_get_url               :string
#  api_get_request_headers   :text
#  api_get_request_type      :integer          default("get")
#  api_get_request_body      :text
#  api_get_request_actions   :text
#  api_get_expected_response :text
#  in_use                    :boolean          default(FALSE)
#  device_group              :string
#

require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end