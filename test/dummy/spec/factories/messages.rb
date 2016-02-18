FactoryGirl.define do
  factory :message, class: Chat::Message do
    text { Faker::Lorem.sentence }
    association :user, factory: :user
    association :conversation, factory: :conversation
  end
end
