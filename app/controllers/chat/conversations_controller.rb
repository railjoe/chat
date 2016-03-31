module Chat
  class ConversationsController < Api::V1::ApiController
    before_action :load_conversation, only: [:show, :mark_as_read]

    def index
      @conversations = current_user.conversations
    end

    def show
    end

    def mark_as_read
      @conversation.header_first.mark_as_read_by current_user
      @conversation.header_last.mark_as_read_by current_user
      head :no_content
    end

    private

    def load_conversation
      @conversation = Conversation.find(params[:id])
    end
  end
end
