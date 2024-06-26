class ChatsController < ApplicationController
  def create
    @application = Application.find_by(token: chat_params[:token])
    return render json: { error: 'Application not found' } if @application.nil?

    Chat::CreateChatJob.perform_async(@application.id)
    render json: { message: 'Chat created successfully' }
  end

  def getApplicationChats
    @application = Application.find_by(token: params[:token])
    return render json: { error: 'Application not found' } if @application.nil?

    @chats = Chat.where(application_id: @application.id)

    @chats = @chats.map do |chat|
      chat.attributes.except('application_id', 'id')
    end
    render json: @chats
  end

  private

  def chat_params
    params.permit(:token)
  end
end
