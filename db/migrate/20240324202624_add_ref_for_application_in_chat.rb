class AddRefForApplicationInChat < ActiveRecord::Migration[7.1]
  def change
    add_reference :chats, :application, foreign_key: true
  end
end
