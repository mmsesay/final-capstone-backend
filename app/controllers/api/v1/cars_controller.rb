class Api::V1::CarsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # /api/v1/cars
  def index
    @cars = Car.all
    render json: all_cars_with_image(@cars)
  end

  # /api/v1/users/:user_id/cars/:id
  def show
    @car = Car.find(params[:id])
    render json: car_object(@car)
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
    @car.user_id = current_user.id

    if @car
      @car.update(car_params)
      render json: { status: 200, massage: 'Car successfully updated.' }
    else
      render json: { status: 400, error: 'Unable to update car.' }
    end
  end

  # /api/v1/users/:user_id/cars/:id
  def destroy
    @car = Car.find(params[:id]).destroy!
    render json: { status: 200, message: 'car deleted successfully' }
  rescue ActiveRecord::RecordNotFound
    render json: { status: 400, message: "no match found for car with id: #{params[:id]}" }
  end

  private

  def car_params
    params.permit(:description, :model_info, :name, :image, :reservation_fee)
  end

  def all_cars_with_image(cars)
    @data = []

    cars.each do |car|
      @data << car_object(car)
    end

    @data
  end
end
