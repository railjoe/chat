class AddImageToMessages < ActiveRecord::Migration
  def change
    add_column :chat_messages, :image, :string
  end
end
