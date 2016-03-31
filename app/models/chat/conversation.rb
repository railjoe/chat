module Chat
  class Conversation < ActiveRecord::Base
    has_many :conversation_headers
    has_many :messages

    def header_first
      conversation_headers.first
    end

    def header_last
      conversation_headers.last
    end
  end
end
