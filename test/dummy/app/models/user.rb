require "chat/conversation_header"
require "chat/conversation"

class User < ActiveRecord::Base
  has_many :conversation_headers, class_name: "Chat::ConversationHeader", foreign_key: "user_1_id"
  has_many :conversations, through: :conversation_headers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
