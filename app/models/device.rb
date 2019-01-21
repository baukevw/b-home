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

class Device < ApplicationRecord
  belongs_to :room
  has_many :schedules

  enum device_type: [:switch, :temperature_reading]

  # after_commit { MqttJob.perform_later(self) }
  after_commit { ActionCable.server.broadcast "mqtt", { commit: 'DeviceStore/changedDevice', payload: self.to_json } }

  def self.from_mqtt(topic, message)
    device = self.find_by(mqtt_topic: topic)
    device.update_attributes!(current_state: message)
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def name_with_room
    "#{self.room.name} - #{self.name}"
  end
end
