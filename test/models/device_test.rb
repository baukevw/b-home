# == Schema Information
#
# Table name: devices
#
#  id               :bigint(8)        not null, primary key
#  name             :string
#  icon             :string
#  device_type      :integer
#  current_state    :string
#  mqtt_topic       :string
#  mqtt_on_message  :string
#  mqtt_off_message :string
#  mqtt_state_topic :string
#  room_id          :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
