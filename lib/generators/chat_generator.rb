require 'rails/generators/named_base'
require 'rails/generators/active_record'

module Chat
  module Generators
    class ChatGenerator < ActiveRecord::Generators::Base

      include Rails::Generators::ResourceHelpers

      namespace "chat"

      def inject_chat_content
        model_path = File.join("app", "models", "#{Chat.user_1_class.downcase}.rb")
        if Chat.user_2_class.present?
          model_path_2 = File.join("app", "models", "#{Chat.user_2_class.downcase}.rb")
          content = <<-CONTENT
  has_many :conversation_headers, class_name: "Chat::ConversationHeader"
  has_many :conversations, through: :conversation_headers
CONTENT
          inject_into_class(model_path_2, Chat.user_2_class.classify.safe_constantize, content)
        else
          content = <<-CONTENT
  has_many :conversation_headers, class_name: "Chat::ConversationHeader", foreign_key: "#{Chat.user_1_class.downcase}_1_id"
  has_many :conversations, through: :conversation_headers
CONTENT
        end
        inject_into_class(model_path, Chat.user_1_class.classify.safe_constantize, content)
      end
    end
  end
end
