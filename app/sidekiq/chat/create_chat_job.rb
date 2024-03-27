class Chat::CreateChatJob
  include Sidekiq::Job

  def perform(application_id, chat_number)
    @chats = Chat.where(application_id: application_id)
    @chat = Chat.new(application_id: application_id, chat_number: @chats.length + 1)
    @chat.save
  end
end
