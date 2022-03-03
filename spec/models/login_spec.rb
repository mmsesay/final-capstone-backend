require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(id: 1, username: 'Test user')
  end

  describe 'user validation tests' do
    it 'validates the presence of a user name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'validates the presence of a user id' do
      @user.id = nil
      expect(@user).to_not be_valid
    end

    it 'validates the user name match' do
      expect(@user.username).to eq 'Test user'
    end

    it 'validates the user id' do
      expect(@user.id).to eq 1
    end
  end
end
