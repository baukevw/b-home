json.extract! schedule, :id, :start_date, :start_time, :end_date, :end_time, :frequency, :device_id, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
