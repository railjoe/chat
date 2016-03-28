# This migration comes from chat (originally 20160328180006)
class AddImageToMessages < ActiveRecord::Migration
  def change
    add_column :chat_messages, :image, :string
  end
end
