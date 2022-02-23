class Api::V1::CarsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    new_car = Car.new(params_create_car)

    if new_car.save
      render json: { status: 200, message: 'New car created' }
    else
      render json: { status: 400, message: 'Unable to create car.' }
    end
  end

  private

  def params_create_car
    params.permit(:name, :description, :image, :model_info, :reservation_fee, :user_id)
  end
end
