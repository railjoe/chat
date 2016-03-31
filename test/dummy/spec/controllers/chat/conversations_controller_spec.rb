# encoding: utf-8

require 'rails_helper'

RSpec.describe Chat::ConversationsController, :type => :controller do
  render_views
  routes { Chat::Engine.routes }

  before(:each) do
    @user = FactoryGirl.create(:user)
    login(@user)
  end

  describe "GET 'conversations/'" do
    it 'should get all the conversations for the current user' do
      # friend = FactoryGirl.create(:user)
      FactoryGirl.create_list(:conversation_header, 7, user_1: @user)
      get :index, format: 'json'
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['conversations'].count).to eq 7
    end
  end

  describe "GET 'conversations/:id'" do
    it 'should get the conversation with id=:id' do
      conversation_headers = FactoryGirl.create_list(:conversation_header, 7, user_1: @user)
      get :show, id: conversation_headers.first.conversation_id, format: 'json'
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['last_message']).to eq conversation_headers.first.conversation.last_message
    end
  end

  describe "POST 'conversations/:id'" do
    it 'should update last_read field for the current user' do
      conversation_headers = FactoryGirl.create_list(:conversation_header, 7, user_1: @user)
      post :mark_as_read, id: conversation_headers.first.conversation_id, format: 'json'
      expect(response.response_code).to eq 204
      conversation_headers.first.reload
      expect(conversation_headers.first.last_read_user_1).to_not be_nil
    end
  end
end
