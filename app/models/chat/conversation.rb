module Chat
  class Conversation < ActiveRecord::Base
    has_many :conversation_headers
    has_many :messages
  end
end
