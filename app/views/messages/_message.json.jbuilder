json.extract! message, :id, :title, :content, :user_id, :visible, :created_at, :updated_at
json.url message_url(message, format: :json)
