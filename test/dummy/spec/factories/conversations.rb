FactoryGirl.define do
  factory :conversation, class: Chat::Conversation do
    last_message { Faker::Lorem.sentence }
  end
end
