json.extract! busker_profile, :id, :user_id, :name, :bio, :created_at, :updated_at
json.url busker_profile_url(busker_profile, format: :json)
