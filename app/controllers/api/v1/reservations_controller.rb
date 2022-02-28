class Api::V1::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # /api/v1/users/:user_id/reservations
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  # /api/v1/users/:user_id/reservations
  def show
    @reservations = Reservation.includes(:car).find_by(user_id: params[:user_id])

    if @reservations
      @data = {
        reservation: @reservations,
        reserved_car: car_object(@reservations.car),
        user_info: @reservations.user
      }
      render json: @data
    else
      render json: { status: 400, message: 'Invalid user_id' }
    end
  end

  # /api/v1/users/:user_id/cars/:car_id/reservations
  def create
    @reserved_car = Reservation.find_by(car_id: params[:car_id])

    # check if a car has been reserved
    if @reserved_car
      render json: {
        status: 400,
        message: "Car with id: #{@reserved_car.id} has been reserved. Please choose another one."
      }
    else
      new_reservation = Reservation.new(params_create_reservation)

      if new_reservation.save
        render json: { status: 200, message: 'car reserved successfully' }
      else
        render json: { status: 400, message: "no match found for car id: #{params[:car_id]}" }
      end
    end
  end

  # /api/v1/users/:user_id/cars/:car_id/reservations/:id
  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update(params_update_reservation)
      render json: { status: 200, message: 'car reservation updated' }
    else
      render json: { status: 400, message: 'unable to update reservation' }
    end
  end

  # /api/v1/users/:user_id/cars/:car_id/reservations/:id
  def destroy
    @reservation = Reservation.find(params[:id]).destroy!
    render json: { status: 200, message: 'car reservation deleted' }
  rescue ActiveRecord::RecordNotFound
    render json: { status: 400, message: "no match found for reservation with id: #{params[:id]}" }
  end

  private

  def params_create_reservation
    params.permit(:duration, :user_id, :car_id)
  end

  def params_update_reservation
    params.permit(:duration, :car_id)
  end
end
