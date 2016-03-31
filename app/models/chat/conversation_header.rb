module Chat
  class ConversationHeader < ActiveRecord::Base
    belongs_to Chat.klass_1.to_sym unless Chat.only_one_model
    belongs_to Chat.klass_2.to_sym unless Chat.only_one_model
    belongs_to "#{Chat.user_1_class.downcase}_1".to_sym, class_name: Chat.user_1_class if Chat.only_one_model
    belongs_to "#{Chat.user_1_class.downcase}_2".to_sym, class_name: Chat.user_1_class if Chat.only_one_model
    belongs_to :conversation, class_name: "Chat::Conversation"

    before_create :check_conversation
    after_create :create_inverse, if: :has_one_model?

    def mark_as_read_by user
      user_class = user.class.name.underscore
      user_id = user.id
      time_now = Time.now
      if Chat.only_one_model
        header_user = user_id == user_1_id ? 'user_1' : 'user_2'
        update_attribute("last_read_#{header_user}", time_now)
      else
        update_attribute("last_read_#{user_class}", time_now)
      end
    end

    private

    def has_one_model?
      Chat.only_one_model
    end

    def check_conversation
      if self.conversation.nil?
        self.conversation = Conversation.create
      end
    end

    def create_inverse
      ConversationHeader.find_or_create_by(
        "#{Chat.klass_1}_id": "#{self.send(Chat.klass_2).id}",
        "#{Chat.klass_2}_id": "#{self.send(Chat.klass_1).id}",
        conversation: conversation
      )
    end
  end
end
