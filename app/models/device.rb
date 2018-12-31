# == Schema Information
#
# Table name: devices
#
#  id                    :bigint(8)        not null, primary key
#  name                  :string
#  icon                  :string
#  api_url               :string
#  api_request_type      :integer          default("get")
#  api_request_headers   :text
#  api_request_body      :text
#  api_request_actions   :text
#  api_expected_response :text
#  room_id               :bigint(8)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  device_type           :integer
#

class Device < ApplicationRecord
  belongs_to :room

  default_scope { order(room_id: :asc, name: :asc) }

  enum api_request_type: [:get, :post]
  enum device_type: [:switch, :other]

  def processed_api_request_body(action)
    return if action.nil?
    self.api_request_body.gsub('[API_REQUEST_ACTION]', action)
  end

  def processed_api_request_actions
    eval(self.api_request_actions).to_a
  end
end
