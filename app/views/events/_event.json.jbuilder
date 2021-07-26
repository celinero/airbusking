json.extract! event, :id, :user_id, :genre_id, :title, :description, :date, :time, :price, :sold, :created_at, :updated_at
json.url event_url(event, format: :json)
