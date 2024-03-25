class UpdateConstains < ActiveRecord::Migration[7.1]
  def change
    change_column :applications, :token, :string, :null => false
    change_column :applications, :name, :string, :null => false
    change_column :messages, :content, :string, :null => false
  end
end
