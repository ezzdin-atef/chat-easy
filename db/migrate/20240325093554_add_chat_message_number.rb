class AddChatMessageNumber < ActiveRecord::Migration[7.1]
  def change
    add_column :chats, :chat_number, :integer, :null => false
    add_column :messages, :message_number, :integer, :null => false
  end
end
