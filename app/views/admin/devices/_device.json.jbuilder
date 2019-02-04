json.extract! device, :id, :name, :icon, :device_type, :current_state, :mqtt_topic, :mqtt_state_topic, :room_id, :data, :created_at, :updated_at
json.url admin_device_url(device)
