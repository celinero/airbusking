json.extract! review, :id, :user_id, :busker_profile_id, :comment, :rating, :created_at, :updated_at
json.url review_url(review, format: :json)
