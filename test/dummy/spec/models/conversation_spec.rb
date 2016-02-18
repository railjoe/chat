require "rails_helper"

RSpec.describe Chat::Conversation, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:conversation)).to be_valid
  end

  context 'validations' do
  end
end
