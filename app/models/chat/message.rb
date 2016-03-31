module Chat
  class Message < ActiveRecord::Base
    mount_uploader :image, ImageUploader

    belongs_to Chat.klass_1.to_sym unless Chat.only_one_model
    belongs_to Chat.klass_2.to_sym unless Chat.only_one_model
    belongs_to "#{Chat.klass_1}_1".to_sym, class_name: Chat.user_1_class if Chat.only_one_model
    belongs_to "#{Chat.klass_1}_2".to_sym, class_name: Chat.user_1_class if Chat.only_one_model
    belongs_to :conversation
    after_create :save_last_message
    after_create :send_push_notification

    private

    def save_last_message
      conversation.update_attribute(:last_message, self.text)
    end

    def send_push_notification
      if Chat.only_one_model
        # TODO
      else
        sender = Chat.klass_1.present? ? send(Chat.klass_1) : send(Chat.klass_2)
        if conversation.header_first.send(Chat.klass_1) == sender.id
          receiver = conversation.header_first.send(Chat.klass_2)
        else
          receiver = conversation.header_first.send(Chat.klass_1)
        end
        PushWooshService.send_message(receiver.push_tokens, "#{sender.email} has sent you a new message")
      end
    end
  end
end
