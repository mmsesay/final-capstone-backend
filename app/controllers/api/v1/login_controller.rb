module Api
  module V1
    class LoginController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        render json: { user: current_user }
      end

      def create
        # lookup for existing user
        existing_user = User.find_by(username: params_login_credentials[:username])

    if existing_user
      pass_current_user(existing_user) # pass the existing_user
      render json: { status: 200, message: 'Login successfully' }
      # render json: { status: 400, message: 'Username already exist.' }
    else
      new_user = User.new(params_login_credentials)

          new_user.save
          render json: new_user, status: :created
          pass_current_user(new_user) # pass the newly created user
        end
      end

      def destroy
        session[:current_user] = nil
        render json: { status: 200, message: 'Logout successful' }
      end

      private

      def params_login_credentials
        params.require(:login).permit(:username)
      end
    end
  end
end
