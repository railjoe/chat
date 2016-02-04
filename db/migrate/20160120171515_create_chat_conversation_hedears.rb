class CreateChatConversationHedears < ActiveRecord::Migration
  def change
    create_table :chat_conversation_hedears do |t|
      if Chat.user_2_class.present?
        user_1 = Chat.user_1_class.downcase
        user_2 = Chat.user_2_class.downcase
        t.references user_1.to_sym, index: true
        t.references user_2.to_sym, index: true
        t.datetime "last_read_#{user_1}".to_sym
        t.datetime "last_read_#{user_2}".to_sym
      else
        user_1 = "#{Chat.user_1_class}_1".downcase
        user_2 = "#{Chat.user_1_class}_2".downcase
        t.references user_1.to_sym, index: true
        t.references user_2.to_sym, index: true
        t.datetime "last_read_#{user_1}".to_sym
        t.datetime "last_read_#{user_2}".to_sym
      end
      t.references :conversation, index: true

      t.timestamps
    end
  end
end
