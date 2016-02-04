require 'rails/generators/named_base'
require 'rails/generators/active_record'

module Chat
  module Generators
    class ChatGenerator < ActiveRecord::Generators::Base

      include Rails::Generators::ResourceHelpers

      namespace "chat"

      def inject_chat_content
        content = <<-CONTENT
  has_many :conversation_headers
  has_many :conversations, through: :conversation_headers
CONTENT
        model_path = File.join("app", "models", "#{Chat.user_1_class.downcase}.rb")
        inject_into_class(model_path, Client, content)
        if Chat.user_2_class.present?
          model_path_2 = File.join("app", "models", "#{Chat.user_2_class.downcase}.rb")
          inject_into_class(model_path_2, Stylist, content)
        end
      end
    end
  end
end
