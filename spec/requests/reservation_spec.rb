require 'rails_helper'

RSpec.describe 'reservations controller', type: :request do
  describe 'GET reservations routes' do
    describe 'GET /api/v1/users/:user_id/reservations' do
      before(:example) { get '/api/v1/users/1/reservations' }

      it 'should return 200 http_status_code' do
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'POST /api/v1/users/:user_id/cars/:car_id/reservations' do
      it 'should return 200 http_status_code' do
        get '/api/v1/users/1/cars/2/reservations'
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'PUT /api/v1/users/:user_id/cars/:car_id/reservations/:id' do
      it 'should return 200 http_status_code' do
        get '/api/v1/users/1/cars/2/reservations/1'
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'DELETE /api/v1/users/:user_id/cars/:car_id/reservations/:id' do
      it 'should return 200 http_status_code' do
        get '/api/v1/users/1/cars/2/reservations/1'
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

