FactoryGirl.define do
  factory :message do
    text { Faker::Lorem.paragraph }
    association :user, factory: :user
    association :conversation, factory: :conversation
  end
end
