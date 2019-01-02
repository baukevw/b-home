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

class Device < ApplicationRecord
  belongs_to :room

  default_scope { order(room_id: :asc, device_group: :asc, name: :asc) }
  scope :in_use_devices, -> { where(in_use: true).order(room_id: :asc, device_group: :asc, name: :asc)  }

  enum api_set_request_type: [:get, :post], _prefix: true
  enum api_get_request_type: [:get, :post], _prefix: true
  enum device_type: [:switch, :other]

  def processed_api_set_request_body(action)
    return if action.nil?
    self.api_set_request_body.gsub('[API_REQUEST_ACTION]', action)
  end

  def processed_api_get_request_body(action)
    return if action.nil?
    self.api_get_request_body.gsub('[API_REQUEST_ACTION]', action)
  end

  def processed_api_set_request_actions
    eval(self.api_set_request_actions).to_a
  end

  def processed_api_get_request_actions
    eval(self.api_set_request_actions).to_a
  end
end
