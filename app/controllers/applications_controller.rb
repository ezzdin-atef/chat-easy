class ApplicationsController < ApplicationController
    def index
        @applications = Application.all
        @applications = @applications.map do |message|
            message.attributes.except('id')
        end

        render json: @applications
    end

    def create
        token = SecureRandom.hex(16)
        while Application.exists?(token: token)
            token = SecureRandom.hex(16)
        end

        Application::CreateApplicationJob.perform_async(application_params[:name], token)
        render json: { token: token }
    end

    def update
        Application::UpdateApplicationJob.perform_async(application_params[:name], params[:token])
        render json: {message: 'Application updated successfully'}
    end

    private

    def application_params
        params.require(:application).permit(:name)
    end
end
