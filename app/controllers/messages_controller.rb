class MessagesController < ApplicationController
  def create
    @application = Application.find_by(token: params[:token])
    return render json: { error: 'Application not found' } if @application.nil?

    @chat = Chat.find_by(chat_number: params[:chat_number], application_id: @application.id)
    return render json: { error: 'Chat not found' } if @chat.nil?

    @messages = Message.where(chat_id: @chat.id)

    Message::CreateMessageJob(@chat.id, params[:content], @messages.length + 1)
    render json: { message: 'Message created successfully' }
  end

  def getChatMessages
    @application = Application.find_by(token: params[:token])
    return render json: { error: 'Application not found' } if @application.nil?

    @chat = Chat.find_by(chat_number: params[:chat_number], application_id: @application.id)
    return render json: { error: 'Chat not found' } if @chat.nil?

    @messages = Message.where(chat_id: @chat.id)
    render json: @messages
  end

  def searchMessage
    @application = Application.find_by(token: params[:token])
    return render json: { error: 'Application not found' } if @application.nil?

    @chat = Chat.find_by(chat_number: params[:chat_number], application_id: @application.id)
    return render json: { error: 'Chat not found' } if @chat.nil?

    @messages = Message.search(params[:q]).records
    render json: @messages

  end

  private

  def message_params
    params.require(:message).permit(:chat_number).permit(:content).permit(:token)
  end
end
