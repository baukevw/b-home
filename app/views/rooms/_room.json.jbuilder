json.extract! room, :id, :name, :icon, :created_at, :updated_at
json.url room_url(room, format: :json)
