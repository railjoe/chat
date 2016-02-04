# This migration comes from chat (originally 20160120171715)
class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.references :conversation, index: true
      user_1 = Chat.user_1_class.downcase.to_sym
      if Chat.user_2_class.present?
        user_2 = Chat.user_2_class.downcase.to_sym
        t.references user_1, index: true
        t.references user_2, index: true
      else
        t.references user_1, index: true
      end
      t.string :text

      t.timestamps
    end

    add_index :chat_messages, :created_at
  end
end
