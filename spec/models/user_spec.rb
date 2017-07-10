require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be a user' do
      expect(User.new).to be_a User
    end
    it 'should have valid input' do
      @user = User.new ({ first_name: 'Mark', last_name: 'Smith', email: 'mark@gmail.com', password: 'easy', password_confirmation: 'easy' })
      expect(@user.save).to be true
    end
    it 'has a password' do
      @user = User.new({ first_name: 'Fred',last_name: 'Smith', email: 'fred@gmail.com', password: nil, password_confirmation: 'password' })
      @user.save
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'has a password confirmation' do
      @user = User.new({ first_name: 'Fred',last_name: 'Smith', email: 'fred@gmail.com', password: 'easy', password_confirmation: nil })
      @user.save
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it 'passwords must match' do
      @user = User.new({ first_name: 'Fred',last_name: 'Smith', email: 'fred@gmail.com', password: 'easy', password_confirmation: 'easier' })
      @user.save
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end










  end
end
