class SetDefaultValueToCount < ActiveRecord::Migration[7.1]
  def change
    change_column :chats, :messages_count, :integer, :default => 0
    change_column :applications, :chats_count, :integer, :default => 0
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
