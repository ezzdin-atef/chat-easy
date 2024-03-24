class FixColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :chats, :message_count, :messages_count
  end
end
