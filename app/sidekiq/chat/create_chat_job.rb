class Chat::CreateChatJob
  include Sidekiq::Job

  def perform(application_id, chat_number)
    Chat.new(application_id: application_id, chat_number: chat_number)
  end
end
