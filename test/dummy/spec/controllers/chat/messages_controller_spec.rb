# encoding: utf-8

require 'rails_helper'

RSpec.describe Chat::MessagesController, :type => :controller do
  render_views
  routes { Chat::Engine.routes }

  before(:each) do
    @user = FactoryGirl.create(:user)
    login(@user)
  end

  describe "POST 'create/'" do
    it 'send message for a new conversation' do
      friend = FactoryGirl.create(:user)
      text = Faker::Lorem.characters(10)
      post :create, format: 'json', id: @user.id, to_user_id: friend.id, text: text
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['text']).to eq text
    end

    it 'send message for an existing conversation' do
      text = Faker::Lorem.characters(10)
      conversation_header = FactoryGirl.create(:conversation_header, user_1: @user)
      post :create, format: 'json', id: @user.id, to_user_id: conversation_header.user_2_id, text: text
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['conversation_id']).to eq conversation_header.conversation.id
    end

    it 'save the last message for a conversation' do
      friend = FactoryGirl.create(:user)
      text = Faker::Lorem.characters(10)
      post :create, format: 'json', id: @user.id, to_user_id: friend.id, text: text
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['text']).to eq text
      conversation_header = Chat::ConversationHeader.find_by(user_1_id: @user.id, user_2_id: friend.id)
      expect(conversation_header.conversation.last_message).to eq text
    end

    it 'send message with an image' do
      friend = FactoryGirl.create(:user)
      image = File.new(File.join(Rails.root, 'spec', 'fixtures', 'images', 'avatar.jpg'))
      post :create, format: 'json', id: @user.id, to_user_id: friend.id, image: image
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['image']).to_not be_nil
    end
  end
end
