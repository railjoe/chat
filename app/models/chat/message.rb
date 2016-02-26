module Chat
  class Message < ActiveRecord::Base
    belongs_to Chat.klass_1.to_sym unless Chat.only_one_model
    belongs_to Chat.klass_2.to_sym unless Chat.only_one_model
    belongs_to "#{Chat.klass_2}_1".to_sym, class_name: Chat.user_1_class if Chat.only_one_model
    belongs_to "#{Chat.klass_2}_2".to_sym, class_name: Chat.user_1_class if Chat.only_one_model
    belongs_to :conversation
    after_create :save_last_message

    private

    def save_last_message
      conversation.update_attribute(:last_message, self.text)
    end
  end
end
