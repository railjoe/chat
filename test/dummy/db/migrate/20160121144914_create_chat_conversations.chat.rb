# This migration comes from chat (originally 20160120171404)
class CreateChatConversations < ActiveRecord::Migration
  def change
    create_table :chat_conversations do |t|
      t.string :last_message

      t.timestamps
    end
  end
end
