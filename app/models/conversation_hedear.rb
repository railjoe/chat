class ConversationHedear < ActiveRecord::Base
  belongs_to Chat.klass_1.to_sym unless only_one_model?
  belongs_to Chat.klass_2.to_sym unless only_one_model?
  belongs_to "#{Chat.klass_2}_1".to_sym, class_name: Chat.user_1_class if only_one_model?
  belongs_to "#{Chat.klass_2}_2".to_sym, class_name: Chat.user_1_class if only_one_model?
  belongs_to :conversation

  before_create :check_conversation
  after_create :create_inverse

  private

  def create_conversation
    if self.conversation.nil?
      self.conversation = Conversation.create
    end
  end

  def create_inverse
    ConversationHeader.create(
      "#{Chat.klass_1}_id": "#{Chat.klass_2.id}",
      "#{Chat.klass_2}_id": "#{Chat.klass_1.id}",
      conversation: conversation
    )
  end
end
