class Api::V1::CarsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index 
        @cars = Car.all
        render json: @cars
    end

    def show 
        @car = Car.find(params[:id])
        render json: @car
    end

    def create
        @car = Car.new(car_params)
    
        if @car.save
          render json: { status: 200, message: 'new car created successfully' }
        else
          render error: { status: 400, error: 'could not create car' }
        end
      end

    def update
        @car = Car.find(params[:id])
        if @car
            @car.update(car_params)
            render json: { massage: 'Car successfully updated.'}, status: 200
        else
            render json: {error: 'Unable to update car.' }, status:400
        end
    end

    def destory 
        @car = Car.find(params[:id])
        if @car
            @car.destory
            render json: { massage: 'Car successfully deleted.' }, status: 200
        else
            render json:{error: 'Unable to delete Car.'}, status: 400
        end
    end

    def car_params
        params.permit(:user_id, :description, :model_info, :name, :image, :reservation_fee)
    end


end
