class MqttPublishJob < ApplicationJob
  queue_as :default
  before_perform :connect_to_broker

  def perform(device, inverse)
    state_message = nil
    case inverse
    when false
      state_message = device.data['mqtt_on_message']
    when true
      state_message = device.data['mqtt_off_message']
    end
    if device.update_attributes(current_state: state_message)
      @client.publish(device.mqtt_topic, state_message)
    end
  end

  private

  def connect_to_broker
    @client = MQTT::Client.new({
      :remote_host => ENV['MQTT_BROKER_HOST'],
      :remote_port => ENV['MQTT_BROKER_PORT'],
      :username => ENV['MQTT_BROKER_USERNAME'],
      :password => ENV['MQTT_BROKER_PASSWORD']
    })
    @client.connect()
  end

end
