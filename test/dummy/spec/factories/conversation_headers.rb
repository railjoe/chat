FactoryGirl.define do
  factory :conversation_header, class: Chat::ConversationHeader do
    association :user_1, factory: :user
    association :user_2, factory: :user
    association :conversation, factory: :conversation
  end
end
