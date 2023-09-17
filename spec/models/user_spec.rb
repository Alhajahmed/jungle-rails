require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save successfully with all required fields' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'should not save when password and password_confirmation do not match' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'differentpassword'
      )
      expect(user).to_not be_valid
    end

    it 'should require password and password_confirmation' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@example.com'
      )
      expect(user).to_not be_valid
    end

    it 'should require a unique email (case-insensitive)' do
      User.create!(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'TEST@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'should require an email' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'should require a first name' do
      user = User.new(
        first_name: nil,
        last_name: 'Doe',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'should require a last name' do
      user = User.new(
        first_name: 'John',
        last_name: nil,
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end
    it 'should require a minimum password length' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@example.com',
        password: 'short',
        password_confirmation: 'short'
      )
      expect(user).to_not be_valid
    end
  end
end
