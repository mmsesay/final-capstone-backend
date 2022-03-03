require 'swagger_helper'

RSpec.describe '/api/v1/login_contoller', type: :request do
  path '/login' do
    post 'Logs the user in' do
      tags 'Login'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        },
        required: ['username']
      }

      response '201', 'login successfully' do
        let(:user) do
          {
            id: 1,
            username: 'test user',
            created_at: '2022-03-03T11:51:46.955Z',
            updated_at: '2022-03-03T11:51:46.955Z'
          }
        end
        run_test!
      end
    end
  end
end
