# encoding: utf-8

require 'spec_helper'

RSpec.describe Chat::MessagesController, :type => :controller do
  render_views

  before(:each) do
    @user = FactoryGirl.create(:user)
    login(@user)
  end

  describe "POST 'create/'" do
    it 'send message' do
      friend = FactoryGirl.create(:user)
      text = Faker::Lorem.characters(10)
      post :create, format: 'json', id: @user.id, to_user_id: friend.id, text: text
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['message']['text']).to eq text
    end

    it 'save the last message for a conversation' do
      friend = FactoryGirl.create(:user)
      text = Faker::Lorem.characters(10)
      post :create, format: 'json', id: @user.id, to_user_id: friend.id, text: text
      conversation = Conversation.find_by(user_1_id: @user.id, user_2_id: friend.id)
      expect(conversation.last_message.text).to eq text
    end
  end
end
