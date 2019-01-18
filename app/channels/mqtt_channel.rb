class MqttChannel < ApplicationCable::Channel
  def subscribed
    stream_from "mqtt"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
