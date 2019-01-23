module AppHelper
  def user_avatar
    if current_user.avatar.present?
      current_user.avatar.thumb.url
    else
      'avatar.png'
    end
  end

  def time_separator
    content_tag :span, ':', class: 'input-group-addon'
  end

  def active_devices(rooms)
    mqtt_on_messages = Device.pluck(:mqtt_on_message).reject(&:blank?)
    Device.where(room_id: rooms).where(current_state: mqtt_on_messages).count
  end

  def inactive_devices(rooms)
    mqtt_off_messages = Device.pluck(:mqtt_off_message).reject(&:blank?)
    Device.where(room_id: rooms).where(current_state: mqtt_off_messages).count
  end
end
