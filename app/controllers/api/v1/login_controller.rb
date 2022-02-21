class Api::V1::LoginController < ApplicationController
  def index
    render json: { login: 'yeah login' }.to_json
  end
end
