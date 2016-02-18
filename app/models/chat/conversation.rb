module Chat
  class Conversation < ActiveRecord::Base
    has_many :conversation_headers
  end
end
