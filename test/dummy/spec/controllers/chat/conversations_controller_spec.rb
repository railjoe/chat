# encoding: utf-8

require 'rails_helper'

RSpec.describe Chat::ConversationsController, :type => :controller do
  render_views

  before(:each) do
    @user = FactoryGirl.create(:user)
    login(@user)
  end

  describe "GET 'conversations/'" do
    it 'should get all the conversations for the current user' do
      friend = FactoryGirl.create(:user)
      text = Faker::Lorem.characters(10)
      get :index, format: 'json'
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['message']['text']).to eq text
    end
  end
end
