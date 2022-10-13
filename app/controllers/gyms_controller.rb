class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :no_record
    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok 
    end


    def destroy
        gym = Gym.find(params[:id])
        gym.memberships.destroy
        gym.destroy
        head :no_content
    end

    private
    def no_record
        render json: {error: "Gym not found"}, status: :not_found
    end
end
