class MqttController < AppController
  before_action :connect_to_broker
  before_action :set_device

  def initialize
    @client = MQTT::Client.new({
      :remote_host => ENV['MQTT_BROKER_HOST'],
      :remote_port => ENV['MQTT_BROKER_PORT']
    })
  end

  def publish
    if @device.update_attributes(current_state: params[:device][:current_state])
      @client.publish(@device.mqtt_topic, params[:device][:current_state])
      head :no_content
    end
  end

  private

  def connect_to_broker
    @client.connect()
  end

  def set_device
    @device = Device.find(params[:device][:id])
  end
end
