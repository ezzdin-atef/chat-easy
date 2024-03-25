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
        @application = Application.new(name: application_params[:name], token: token)
        if @application.save
            render json: {token: @application.token}
        else
            render json: {error: 'Error creating application'}
        end
    end

    def update
        @application = Application.find_by(token: params[:token])
        if @application.update(name: application_params[:name])
            render json: {message: 'Application updated successfully'}
        else
            render json: {error: 'Error updating application'}
        end
    end

    private

    def application_params
        params.require(:application).permit(:name)
    end
end
