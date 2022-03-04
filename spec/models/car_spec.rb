require 'rails_helper'

RSpec.describe Car, type: :model do
  before(:each) do
    @car = Car.new(name: 'Test Car', description: 'Test description', model_info: 'Test model', image: 'test.png', reservation_fee: 100)
  end

  describe 'car validation tests' do
    it 'validates the presence of a car name' do
      @car.name = nil
      expect(@car).to_not be_valid
    end

    it 'validates the presence of a car description' do
      @car.description = nil
      expect(@car).to_not be_valid
    end

    it 'validates the presence of a car model info' do
      @car.model_info = nil
      expect(@car).to_not be_valid
    end

    it 'validates the presence of a car image' do
      @car.image = nil
      expect(@car).to_not be_valid
    end

    it 'validates the presence of a car reservation fee' do
      @car.reservation_fee = nil
      expect(@car).to_not be_valid
    end

    it 'validates the name match' do
      expect(@car.name).to eq 'Test Car'
    end

    it 'validates the description match' do
      expect(@car.description).to eq 'Test description'
    end

    it 'validates the model_info match' do
      expect(@car.model_info).to eq 'Test model'
    end

    it 'validates the image match' do
      expect(@car.image).to eq 'test.png'
    end

    it 'validates the reservation fee match' do
      expect(@car.reservation_fee).to eq 100
    end
  end
end
