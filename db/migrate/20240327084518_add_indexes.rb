class AddIndexes < ActiveRecord::Migration[7.1]
  def change
    add_index :applications, :token
    add_index :chats, [:chat_number, :application_id]
    add_index :messages, [:message_number, :chat_id]
  end
end
