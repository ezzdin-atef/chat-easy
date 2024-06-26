class MessagesController < ApplicationController
  def create
    @application = Application.find_by(token: params[:token])
    return render json: { error: 'Application not found' } if @application.nil?

    @chat = Chat.find_by(chat_number: params[:chat_number], application_id: @application.id)
    return render json: { error: 'Chat not found' } if @chat.nil?

    Message::CreateMessageJob.perform_async(@chat.id, params[:content])
    render json: { message: 'Message created successfully' }
  end

  def getChatMessages
    @application = Application.find_by(token: params[:token])
    return render json: { error: 'Application not found' } if @application.nil?

    @chat = Chat.find_by(chat_number: params[:chat_number], application_id: @application.id)
    return render json: { error: 'Chat not found' } if @chat.nil?

    @messages = Message.where(chat_id: @chat.id)
    @messages = @messages.map do |message|
      message.attributes.except('chat_id', 'id')
    end
    render json: @messages
  end

  def searchMessage
    @application = Application.find_by(token: params[:token])
    return render json: { error: 'Application not found' } if @application.nil?

    @chat = Chat.find_by(chat_number: params[:chat_number], application_id: @application.id)
    return render json: { error: 'Chat not found' } if @chat.nil?

    @messages = Message.search(params[:q]).records
    @messages = @messages.map do |message|
      message.attributes.except('chat_id', 'id')
    end
    render json: @messages

  end

  private

  def message_params
    params.require(:message).permit(:chat_number).permit(:content).permit(:token)
  end
end
