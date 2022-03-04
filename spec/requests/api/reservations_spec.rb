require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  path '/reservations' do
    get 'Get all reservations' do
      tags 'Reservations'
      produces 'application/json', 'application/xml'

      response '200', 'reservation found' do
        schema type: :array,
          properties: {
            id: { type: :integer },
            car_id: { type: :integer },
            user_id: { type: :integer },
            duration: { type: :integer },
            car_name: { type: :string }
          },
          required: ['car_id', 'user_id', 'duration']
        run_test!
      end

      response '422', 'invalid request'
    end

    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          car_id: { type: :integer },
          user_id: { type: :integer },
          duration: { type: :integer }
        },
        required: ['car_id', 'user_id', 'duration']
      }

      response '201', 'car reserved successfully' do
        let(:reservation) { { status: 200, message: 'car reserved successfully' } }
        run_test!
      end

      response '400', 'could not create reservation'
    end
  end

  path '/reservations{id}' do
    patch 'updates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          car_id: { type: :integer },
          user_id: { type: :integer },
          duration: { type: :integer }
        },
        required: ['car_id', 'user_id', 'duration']
      }

      response '200', 'car reservation updated' do
        let(:reservation) { { status: 200, message: 'car reservation updated' } }
        run_test!
      end

      response '400', 'unable to update reservation'
    end

    delete 'delete a car' do
      tags 'Resrvations'
      consumes 'application/json'
      parameter name: :resrvation, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer }
        },
        required: ['id']
      }

      response '200', 'car reservation deleted' do
        let(:reservation) { { status: 200, message: 'car reservation deleted' } }
        run_test!
      end

      response '400', 'no match found for reservation with id {id}'
    end
  end
end
