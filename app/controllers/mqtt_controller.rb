class MqttController < AppController
  before_action :connect_to_broker
  before_action :set_device

  def initialize
    @client = MQTT::Client.new({
      :client_id => "BHOME_CONT_#{(0...8).map { (65 + rand(26)).chr }.join}",
      :remote_host => ENV['MQTT_BROKER_HOST'],
      :remote_port => ENV['MQTT_BROKER_PORT'],
      :username => ENV['MQTT_BROKER_USERNAME'],
      :password => ENV['MQTT_BROKER_PASSWORD']
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
