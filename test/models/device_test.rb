# == Schema Information
#
# Table name: devices
#
#  id                    :bigint(8)        not null, primary key
#  name                  :string
#  icon                  :string
#  api_url               :string
#  api_request_type      :integer          default(0)
#  api_request_headers   :text
#  api_request_body      :text
#  api_request_actions   :text
#  api_expected_response :text
#  room_id               :bigint(8)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
