require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    # @car = Car.new(name: 'John', bio: 'I am a content creator', photo: '', posts_counter: 0)
    # @user = User.new(username: 'John Doe')
    # 5.times do |i|
    #   @car = Car.new(name: "Car #{i}", image: "photo #{i}", description: "description #{i}", model_info: "model #{i}", reservation_fee: "#{i}.00", user_id: @user.id)
    # end

    # # @posts = Post.where(author_id: @user.id).all
    # 3.times do |i|
    #   @reservation = Reservation.new(duration: "#{i}.to_s", user_id: @user.id, car_id: @car.id)
    # end

    @reservation = Reservation.new(duration: "4", user_id: 1, car_id: 2)
  end

  describe 'reservation validation tests' do
    it 'validates the presence of a duration' do
      @reservation.duration = nil
      expect(@reservation).to_not be_valid
    end
  end
end
