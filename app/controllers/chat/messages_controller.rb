module Chat
  class MessagesController < Api::V1::ApiController
    before_action :load_conversation, only: [:create]

    def create
      current_user_class = current_user.class.name.underscore
      @message = @conversation.messages.create(
        "#{current_user_class}_id": current_user.id,
        text: params[:text],
        image: params[:image]
      )
    end

    private

    def load_conversation
      if Chat.klass_1 == current_user.class.name.underscore
        id_klass_1 = current_user.id
        id_klass_2 = params[:to_user_id]
      else
        id_klass_1 = params[:to_user_id]
        id_klass_2 = current_user.id
      end
      conv_hedear = ConversationHeader.find_or_create_by(
        "#{Chat.klass_1}_id": id_klass_1,
        "#{Chat.klass_2}_id": id_klass_2
      )
      @conversation = conv_hedear.conversation
    end
  end
end
