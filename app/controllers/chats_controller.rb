class ChatsController < ApplicationController
  def create
    @application = Application.find_by(token: chat_params[:token])
    return render json: { error: 'Application not found' } if @application.nil?

    @chats = Chat.where(application_id: @application.id)

    @chat = Chat.new(application_id: @application.id, chat_number: @chats.length + 1)
    if @chat.save
      render json: { message: 'Chat created successfully' }
    else
      render json: { error: 'Error creating chat' }
    end
  end

  def getApplicationChats
    @application = Application.find_by(token: params[:token])
    return render json: { error: 'Application not found' } if @application.nil?

    @chats = Chat.where(application_id: @application.id)
    render json: @chats
  end

  private

  def chat_params
    params.permit(:token)
  end
end
