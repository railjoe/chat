module Chat
  class MessagesController < Api::V1::ApiController
    before_action :load_conversation, only: [:create]

    def create
      @message = @conversation.messages.create(
        user_id: current_user.id,
        text: params[:text]
      )
    end

    private

    def load_conversation
      conv_hedear = ConversationHeader.create(
        "#{Chat.klass_1}_id": current_user.id,
        "#{Chat.klass_2}_id": params[:to_user_id]
      )
      @conversation = conv_hedear.conversation
    end
  end
end