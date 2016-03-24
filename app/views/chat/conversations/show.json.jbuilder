json.id @conversation.id
json.user_1_id @conversation.last_message
json.created_at @conversation.created_at
json.updated_at @conversation.updated_at

json.messages @conversation.messages do |message|
  json.id message.id
  if Chat.only_one_model
    json.user_1_id message.send("#{Chat.klass_1}_1").try(:id)
    json.user_2_id message.send("#{Chat.klass_1}_2").try(:id)
  else
    json.user_1_id message.send(Chat.klass_1).try(:id)
    json.user_2_id message.send(Chat.klass_2).try(:id)
  end
  json.text message.text
  json.created_at message.created_at
  json.updated_at message.updated_at
end
