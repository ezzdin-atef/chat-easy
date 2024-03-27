class Message::CreateMessageJob
  include Sidekiq::Job

  def perform(chat_id, content, message_number)
    @message = Message.new(chat_id: @chat.id, content: params[:content], message_number: @messages.length + 1)
    @message.save
  end
end
