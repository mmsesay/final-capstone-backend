class Api::V1::CarsController < ApplicationController
    skip_before_action :verify_authenticity_token
    # /api/v1/cars
    def index 
        @cars = Car.all
        render json: @cars
    end

    #
    def show 
        @car = Car.find(params[:id])
        render json: @car
    end
# /api/v1/users/:user_id/cars/:id
    def create
        @car = Car.new(car_params)
    
        if @car.save
          render json: { status: 200, message: 'new car created successfully' }
        else
          render error: { status: 400, error: 'could not create car' }
        end
      end
    # /api/v1/users/:user_id/cars/:id
    def update
        @car = Car.find(params[:id])

        if @car
            @car.update(car_params)
            render json: { status: 200, massage: 'Car successfully updated.'}
            else
            render json: { status: 400, error: 'Unable to update car.' }
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
