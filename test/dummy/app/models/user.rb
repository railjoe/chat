class User < ActiveRecord::Base
  acts_as_token_authenticatable
  has_many :conversation_headers, class_name: "Chat::ConversationHeader", foreign_key: "user_1_id"
  has_many :conversations, through: :conversation_headers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
