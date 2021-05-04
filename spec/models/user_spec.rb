require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it "should check that all four fields save successfully" do
      users = User.new(first_name: 'Richard', last_name: 'Castro', email:'test@abc.com', password: '123456', password_confirmation: '123456')
      expect(users).to be_valid
      expect(users.errors.full_messages).to be_empty
    end
    it "should check that all four fields save successfully" do
      users = User.new(first_name: 'Richard', last_name: 'Castro', email:'test@abc.com', password: nil, password_confirmation: nil)
      expect(users).to_not be_valid
      puts users.errors.full_messages
    end
    it "should check is password and password_confirmation match" do
      users = User.new(first_name: 'Richard', last_name: 'Castro', email:'test@abc.com', password: '123456', password_confirmation: '234567')
      expect(users).to_not be_valid
      puts users.errors.full_messages
    end
    it "is not valid without a first_name" do
      users = User.new(first_name: nil, last_name: 'Castro', email:'test@abc.com', password: '123456', password_confirmation: '123456')
      expect(users).to_not be_valid
      puts users.errors.full_messages
    end
    it "is not valid without a last_name" do
      users = User.new(first_name: 'Eric', last_name: nil, email:'test@abc.com', password: '123456', password_confirmation: '123456')
      expect(users).to_not be_valid
      puts users.errors.full_messages
    end
    it "is not valid if password is less than 6 characters" do
      users = User.new(first_name: 'Eric', last_name: 'Andrews', email:'test@abc.com', password: '1234', password_confirmation: '1234')
      expect(users).to_not be_valid
      puts users.errors.full_messages
    end
  end
  describe '.authenticate_with_credentials' do
    before(:each) do 
      @user = User.new(first_name: 'Eric', last_name: 'Andrews', email:'test@abc.com', password: '123456', password_confirmation: '123456')
    end
    it "email should not be valid" do
      @user.email = '  test@abc.com'
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email must contain no spaces")
    end
  end
end
