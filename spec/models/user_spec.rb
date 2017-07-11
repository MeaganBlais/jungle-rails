require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be a user' do
      expect(User.new).to be_a User
    end
    it 'should have valid input' do
      @user = User.new ({ first_name: 'Mark', last_name: 'Smith', email: 'mark@gmail.com', password: 'easy123', password_confirmation: 'easy123' })
      expect(@user.save).to be true
    end
    it 'has a password' do
      @user = User.new({ first_name: 'Fred',last_name: 'Smith', email: 'fred@gmail.com', password: nil, password_confirmation: 'easy123' })
      @user.save
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'has a password confirmation' do
      @user = User.new({ first_name: 'Fred',last_name: 'Smith', email: 'fred@gmail.com', password: 'easy123', password_confirmation: nil })
      @user.save
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end
    it 'passwords must match' do
      @user = User.new({ first_name: 'Fred',last_name: 'Smith', email: 'fred@gmail.com', password: 'easy123', password_confirmation: 'easier' })
      @user.save
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'email must be unique' do
      @user1 = User.create({ first_name: 'Freddie',last_name: 'Smith', email: 'freddy@gmail.com', password: 'easy123', password_confirmation: 'easy123' })
      @user2 = User.new({ first_name: 'Freddy',last_name: 'Smith', email: 'freddy@gmail.com', password: 'easy123', password_confirmation: 'easy123' })
      @user2.save
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end

  end

    describe '.authenticate_with_credentials' do


    it "return user when passed correct params" do
      @user = User.create({ first_name: 'Freddy',last_name: 'Smith', email: 'freddy@gmail.com', password: 'easy123', password_confirmation: 'easy123' })
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eql @user
    end

    it "return nil when passed incorrect email" do
      @user = User.create({ first_name: 'Freddy',last_name: 'Smith', email: 'freddy@gmail.com', password: 'easy123', password_confirmation: 'easy123' })
      expect(User.authenticate_with_credentials("incorrect_email", @user.password)).to eql nil
    end

    it "return nil when passed incorrect password" do
      @user = User.create({ first_name: 'Freddy',last_name: 'Smith', email: 'freddy@gmail.com', password: 'easy123', password_confirmation: 'easy123' })
      expect(User.authenticate_with_credentials(@user.email, "hard123")).to eql nil
    end

    it "return user when passed spaces before email" do
      @user = User.create({ first_name: 'Freddy',last_name: 'Smith', email: 'freddy@gmail.com', password: 'easy123', password_confirmation: 'easy123' })
      expect(User.authenticate_with_credentials("   #{@user.email}", "easy123")).to eql @user
    end

    it "return user when passed mixed case email" do
      @user = User.create({ first_name: 'Freddy',last_name: 'Smith', email: 'freddy@gmail.com', password: 'easy123', password_confirmation: 'easy123' })
      expect(User.authenticate_with_credentials(@user.email.upcase, "easy123")).to eql @user
    end

  end
end
