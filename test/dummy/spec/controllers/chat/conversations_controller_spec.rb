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
end
