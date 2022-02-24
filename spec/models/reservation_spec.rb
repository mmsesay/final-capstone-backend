require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @reservation = Reservation.new(duration: '4', user_id: 1, car_id: 2)
  end

  describe 'reservation validation tests' do
    it 'validates the presence of a duration' do
      @reservation.duration = nil
      expect(@reservation).to_not be_valid
    end

    it 'validates the presence of a car' do
      @reservation.car_id = nil
      expect(@reservation).to_not be_valid
    end

    it 'validates the presence of a user' do
      @reservation.user_id = nil
      expect(@reservation).to_not be_valid
    end

    it 'validates the duration match' do
      expect(@reservation.duration).to eq 4
    end

    it 'validates the user_id match' do
      expect(@reservation.user_id).to eq 1
    end

    it 'validates the car_id match' do
      expect(@reservation.car_id).to eq 2
    end
  end
end
