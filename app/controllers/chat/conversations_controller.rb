module Chat
  class ConversationsController < ApplicationController
    def index
      @conversations = send(Chat.method_current_user).conversations
    end
  end
end
