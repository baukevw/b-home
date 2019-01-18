class MqttService

  attr_reader :client

  def initialize
    @client = MQTT::Client.new({
      :remote_host => ENV['MQTT_BROKER_HOST'],
      :remote_port => ENV['MQTT_BROKER_PORT'],
      :reconnect => true
    })
  end

  def connect_to_broker
    @client.connect()
    subscribe
    receive
  end

  def subscribe
    @client.subscribe('ToDashboard/#')
  end

  def receive
    Thread.new do
      @client.get do |topic, message|
        process_data(topic, message)
      end
    end
  end

  def process_data(topic, message)
    formatted_topic = format_topic(topic)
    Rails.logger.info formatted_topic

    Device.from_mqtt(formatted_topic, message)
  end

  private

  def format_topic(topic)
    topic.gsub("ToDashboard/", "ToDevice/")
  end
end
