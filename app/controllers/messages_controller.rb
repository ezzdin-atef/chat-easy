class MessagesController < ApplicationController
  def create
    @application = Application.find_by(token: params[:token])
    return render json: { error: 'Application not found' } if @application.nil?

    @chat = Chat.find_by(chat_number: params[:chat_number], application_id: @application.id)
    return render json: { error: 'Chat not found' } if @chat.nil?

    @messages = Message.where(chat_id: @chat.id)

    @message = Message.new(chat_id: @chat.id, content: params[:content], message_number: @messages.length + 1)
    if @message.save
      render json: { message: 'Message created successfully' }
    else
      render json: { error: 'Error creating message' }
    end
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
