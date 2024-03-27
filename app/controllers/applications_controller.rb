class ApplicationsController < ApplicationController
    def index
        @applications = Application.all
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
        @application = Application.find_by(token: params[:token])
        Application::UpdateApplicationJob.perform_async(application_params[:name])
        render json: {message: 'Application updated successfully'}
    end

    private

    def application_params
        params.require(:application).permit(:name)
    end
end
