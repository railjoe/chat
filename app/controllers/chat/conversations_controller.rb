module Chat
  class ConversationsController < Api::V1::ApiController
    def index
      @conversations = send(Chat.method_current_user).conversations
    end

    def show
      @conversation = Conversation.find(params[:id])
    end
  end
end
