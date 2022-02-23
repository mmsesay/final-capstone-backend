class Api::V1::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index; end

  def new; end

  def show; end

  # /api/v1/users/:user_id/cars/:car_id/reservations
  def create
    new_reservation = Reservation.new(params_create_reservation)

    if new_reservation.save
      render json: { status: 200, message: 'car reserved successfully' }
    else
      render json: { status: 400, message: 'Unable to reserved car.' }
    end
  end

  def edit; end

  def update; end

  def destroy; end

  def params_create_reservation
    params.permit(:duration, :user_id, :car_id)
  end
end
