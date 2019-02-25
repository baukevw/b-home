class MqttService

  attr_reader :client

  def initialize
    @client = MQTT::Client.new({
      :client_id => "BHOME_SERVICE_#{(0...8).map { (65 + rand(26)).chr }.join}",
      :remote_host => ENV['MQTT_BROKER_HOST'],
      :remote_port => ENV['MQTT_BROKER_PORT'],
      :username => ENV['MQTT_BROKER_USERNAME'],
      :password => ENV['MQTT_BROKER_PASSWORD'],
      :reconnect => true
    })
  end

  def connect_to_broker
    @client.connect()
    subscribe
    receive
  end

  def subscribe
    @client.subscribe('ToDash/#')
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
    topic.gsub("ToDash/", "ToDevice/")
  end
end
