json.conversations @conversations do |conversation|
  json.id conversation.id
  json.last_message conversation.last_message
  json.created_at conversation.created_at
  json.updated_at conversation.updated_at
end
