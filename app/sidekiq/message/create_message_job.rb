class Message::CreateMessageJob
  include Sidekiq::Job

  def perform(chat_id, content)
    @messages = Message.where(chat_id: chat_id)
    @message = Message.new(chat_id: chat_id, content: content, message_number:  @messages.length + 1)
    @message.save
  end
end
