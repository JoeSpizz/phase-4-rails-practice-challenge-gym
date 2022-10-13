class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :no_record
    def show
        client = Client.find(params[:id])
        render json: client, status: :ok 
    end

    private

    def no_record
        render json: {error: "No client found"}, status: :not_found
    end
end
