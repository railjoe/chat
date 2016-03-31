json.id @conversation.id
json.last_message @conversation.last_message
json.last_read_user_1 @conversation.header_first.last_read_user_1
json.last_read_user_2 @conversation.header_first.last_read_user_2
json.created_at @conversation.created_at
json.updated_at @conversation.updated_at

json.messages @conversation.messages do |message|
  json.id message.id
  if Chat.only_one_model
    if message.send("#{Chat.klass_1}_1").present?
      json.user_id message.send("#{Chat.klass_1}_1").id
    else
      json.user_id message.send("#{Chat.klass_1}_2").id
    end
  else
    if message.send("#{Chat.klass_1}_1").present?
      json.user_id message.send(Chat.klass_1).id
    else
      json.user_id message.send(Chat.klass_2).id
    end
  end
  json.text message.text
  json.image message.image.url
  json.created_at message.created_at
  json.updated_at message.updated_at
end
