require "rails_helper"

RSpec.describe Chat::ConversationHeader, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:conversation_header)).to be_valid
  end

  context 'validations' do
  end
end
