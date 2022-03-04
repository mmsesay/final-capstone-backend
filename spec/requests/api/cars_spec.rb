require 'swagger_helper'

RSpec.describe 'api/v1/cars', type: :request do
  path '/cars' do
    get 'Get all cars' do
      tags 'Cars'
      produces 'application/json', 'application/xml'

      response '200', 'car found' do
        schema type: :object,
          properties: {
            name: { type: :string },
            description: { type: :string },
            model_info: { type: :string },
            reservation_fee: { type: :string },
            image: { type: :string }
          },
          required: ['name', 'description', 'model_info', 'reservation_fee', 'image']
        run_test!
      end

      response '422', 'invalid request'
    end

    post 'Creates a car' do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          model_info: { type: :string },
          reservation_fee: { type: :string },
          image: { type: :string }
        },
        required: ['name', 'description', 'model_info', 'reservation_fee', 'image']
      }

      response '201', 'new car created successfully' do
        let(:car) { { status: 200, message: 'new car created successfully' } }
        run_test!
      end

      response '422', 'invalid request'
    end
  end

  path '/cars{id}' do
    patch 'updates a car' do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          model_info: { type: :string },
          reservation_fee: { type: :string },
          image: { type: :string }
        },
        required: ['name', 'description', 'model_info', 'reservation_fee', 'image']
      }

      response '201', 'car updated successfully' do
        let(:car) { { status: 200, message: 'car updated successfully' } }
        run_test!
      end

      response '422', 'invalid request'
    end

    delete 'delete a car' do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :string }
        },
        required: ['id']
      }

      response '200', 'car deleted successfully' do
        let(:car) { { status: 200, message: 'car deleted successfully' } }
        run_test!
      end

      response '422', 'invalid request'
    end
  end
end
