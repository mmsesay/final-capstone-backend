class Api::V1::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # /api/v1/users/:user_id/reservations
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  # /api/v1/users/:user_id/reservations
  def show
    @reservations = Reservation.includes(:car).find_by(user_id: current_user.id)
    render json: @reservations
  end

  # /api/v1/reservations
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
      new_reservation.start_date = Time.now
      new_reservation.end_date = new_reservation.start_date + new_reservation.duration.day
      new_reservation.car_name = Car.find(params[:car_id]).name
      if new_reservation.save
        render json: { status: 200, message: 'car reserved successfully' }
      else
        render json: { status: 400, message: "no match found for car id: #{params[:car_id]}" }
      end
    end
  end

  # /api/v1/reservations/:id
  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update(params_create_reservation)
      render json: { status: 200, message: 'car reservation updated' }
    else
      render json: { status: 400, message: 'unable to update reservation' }
    end
  end

  # /api/v1/reservations/:id
  def destroy
    @reservation = Reservation.find(params[:id]).destroy!
    render json: { status: 200, message: 'car reservation deleted' }
  rescue ActiveRecord::RecordNotFound
    render json: { status: 400, message: "no match found for reservation with id: #{params[:id]}" }
  end

  private

  def params_create_reservation
    params.permit(:user_id, :duration, :car_id)
  end
end
